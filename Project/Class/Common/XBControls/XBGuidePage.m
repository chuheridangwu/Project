//
//  XBGuidePage.m
//  model
//
//  Created by DYM on 16/7/10.
//  Copyright © 2016年 龙少. All rights reserved.
//

#import "XBGuidePage.h"

@interface XBGuidePage ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollerView;
@property (nonatomic,strong)NSArray *imgs;
@end

@implementation XBGuidePage

+ (XBGuidePage *)showGuidePageaWith:(UIView *)supView imgs:(NSArray *)imgs{
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"APPVision"] isEqualToString:[self currentVersion]] ){
        return nil;
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:[self currentVersion] forKey:@"APPVision"];
    }
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        XBGuidePage *guide = [[XBGuidePage alloc]initWithView:supView];
        guide.imgs = imgs;
        
        [guide addSubViewWithImgs:imgs];
        
        [supView addSubview:guide];
        
         return guide;
    
    }else{
        
        return nil;
    }
   
}

- (id)initWithView:(UIView*)supView{
    return [self initWithFrame:supView.frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.scrollerView = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollerView.delegate  =self;
        self.scrollerView.pagingEnabled = YES;
        self.scrollerView.showsHorizontalScrollIndicator = NO;
        self.scrollerView.showsVerticalScrollIndicator = NO;
        
        
        [self addSubview:self.scrollerView];
    }
    return self;
}

- (void)addSubViewWithImgs:(NSArray *)imgs{
    
    CGFloat width = self.scrollerView.frame.size.width;
    CGFloat height = self.scrollerView.frame.size.height;
    
    for (int i = 0; i < imgs.count; i++) {
        CGFloat imgViewX = width * i ;
    
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imgViewX, 0 , width, height)];
        imageView.image = [UIImage imageNamed:imgs[i]];
        [self.scrollerView addSubview:imageView];
    }
    
    [self.scrollerView setContentSize:CGSizeMake(imgs.count * width, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetW = scrollView.frame.size.width;
    CGFloat offsetH = scrollView.frame.size.height;
    //当前偏移量 + 30，动画效果移除
    if (offsetX > offsetW * (self.imgs.count - 1) + 30) {
        [self disMissView];
    }
    
    //最后一张图片加Btn
    if (offsetX >= offsetW * (self.imgs.count -1)) {
        CGFloat btnW = 200;
        CGFloat btnX = (offsetW - btnW) / 2;
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(offsetW * (self.imgs.count - 1) + btnX, offsetH * 0.7, btnW, offsetH - (offsetH * 0.7))];
        [btn addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchDown];
        btn.backgroundColor = [UIColor clearColor];
        [self.scrollerView addSubview:btn];
    }

    //禁止向左滑动
    if (scrollView.contentOffset.x < 0) {
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:NO];
    }
}

- (void)disMissView{
    [self transitionWithType:@"rippleEffect" ForView:self];

}

- (void)transitionWithType:(NSString *) type ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 1.5;
    
    //设置运动type
    animation.type = type;
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
    
    self.scrollerView.hidden = 1;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}


+  (NSString*)currentVersion{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}
@end
