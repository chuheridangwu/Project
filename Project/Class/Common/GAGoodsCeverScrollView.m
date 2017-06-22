//
//  GAGoodsCeverScrollView.m
//  ManMao
//
//  Created by dym on 16/11/23.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GAGoodsCeverScrollView.h"

@interface GAGoodsCeverScrollView () <UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *iconImage;
@property (nonatomic,strong)UIScrollView *scrollView;

@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *indexLabel;

@property (nonatomic,strong)NSArray *imgs;
@property (nonatomic,assign)NSInteger imgIndex;
@property (nonatomic,assign)CGRect sourceframe;
@end

@implementation GAGoodsCeverScrollView

+ (GAGoodsCeverScrollView*)shareGAGoodsCeverScrollView{
    return [[GAGoodsCeverScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
       
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.iconImage];
        
        [self addSubview:self.topView];
        self.topView.alpha = 0;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ceverTap:)];
        [self.scrollView addGestureRecognizer:tap];
        
         UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ceverTap1:)];
        [self.iconImage addGestureRecognizer:tap1];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

+ (void)hiddenImageViewFrame:(CGRect)frame imgs:(NSArray *)imgs index:(NSInteger)index ImgStyle:(GAGoodsImgsStyle)style{
    [[GAGoodsCeverScrollView shareGAGoodsCeverScrollView]setImgViewFrame:frame imgs:imgs index:index ImgStyle:style];
}

- (void)setImgViewFrame:(CGRect)frame imgs:(NSArray*)imgs index:(NSInteger)index ImgStyle:(GAGoodsImgsStyle)style{
    self.imgs = imgs;
    self.imgIndex = index;
    self.sourceframe = frame;
    self.indexLabel.attributedText = [self changeStringSize:[NSString stringWithFormat:@"%ld/%ld",index+1,imgs.count]];
    
    self.iconImage.frame = frame;
    
    if (style == GAGoodsImgsStyle_ImgURL) {
        [self.iconImage sd_setImageWithURL:[NSURL URLWithString:imgs[index]] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    }else{
            self.iconImage.image = imgs[index];
    }
   

    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * imgs.count, self.scrollView.frame.size.height);
     [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width *index, 0) animated:NO];
     self.iconImage.alpha = 0;

    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.iconImage.center = self.scrollView.center;
        self.scrollView.alpha = 1;
        
        self.topView.alpha = 1;
        // 设置轮播图放大
        for (int i = 0; i < imgs.count; i++) {
            CGFloat imgX = self.scrollView.frame.size.width * i;
            
            UIScrollView *subScrillView = [[UIScrollView alloc]initWithFrame:CGRectMake(imgX, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
            subScrillView.delegate = self;
            subScrillView.bounces = NO;
            subScrillView.minimumZoomScale = 1;
            subScrillView.maximumZoomScale = 2;
            subScrillView.showsVerticalScrollIndicator = NO;
            subScrillView.showsHorizontalScrollIndicator = NO;
            subScrillView.tag  = 1;
            [self.scrollView addSubview:subScrillView];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, subScrillView.frame.size.width, subScrillView.frame.size.height)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.userInteractionEnabled = YES;
            [subScrillView addSubview:imageView];
            
            if (style == GAGoodsImgsStyle_ImgURL) {
                [imageView sd_setImageWithURL:[NSURL URLWithString:imgs[i]] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
            }else{
                imageView.image  = imgs[i];
            }
        }
        
    } completion:^(BOOL finished) {
        
    
       
    }];
    
}


- (void)loopImageViewFooterTranster:(CGFloat)angle AndIndexPath:(NSInteger)indexpath AndTotal:(NSInteger)total{
//    [self insertSubview:self.indexLabel atIndex:self.indexLabel.subviews.count - 2];
    
    if (angle > - 0.5) {
        [self.indexLabel.layer setTransform:[self roundViewTransformAngel:angle]];
        self.indexLabel.layer.zPosition = self.frame.size.width/20.0;
    }else{
        [self.indexLabel.layer setTransform:[self roundViewTransformAngel: 1-angle]];
        self.indexLabel.layer.zPosition = self.frame.size.width/20.0;
    }
    
    if(angle < -0.5){
        self.indexLabel.attributedText = [self changeStringSize:[NSString stringWithFormat:@"%ld/%ld",indexpath+1,total]];
    }
}

- (CATransform3D)roundViewTransformAngel:(CGFloat)angle{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0/-900;
    transform = CATransform3DRotate(transform, -angle *M_PI, 0, 1, 0);
    return transform;
}

- (NSMutableAttributedString*)changeStringSize:(NSString*)str{
    NSMutableAttributedString * AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:22.0]
     
                          range:NSMakeRange(0, 1)];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:16.0]
     
                          range:NSMakeRange(1, str.length - 1)];
    return AttributedStr;
}

#pragma mark ----- 滚动视图代理 ---- 
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //设置偏移量
    NSInteger row = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    NSInteger currentCellNum = scrollView.contentOffset.x / self.scrollView.frame.size.width;
    CGFloat leftMoveX = (currentCellNum + 1) * self.scrollView.frame.size.width -scrollView.contentOffset.x;
    
    if (scrollView.tag != 1) {
       [self loopImageViewFooterTranster: - leftMoveX/self.scrollView.frame.size.width AndIndexPath:row  AndTotal:self.imgs.count];
    }
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
       return [scrollView.subviews firstObject];
    }
    return nil;
}

- (void)ceverTap:(UITapGestureRecognizer*)tapView{
    UIImageView *subImgView;
    NSInteger count = self.scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;

    NSMutableArray *Array = [NSMutableArray array];
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            [Array addObject:view];
        }
    }
    if (self.imgs.count != 0 && Array.count != 0) {
        UIScrollView *subScrollView = Array[count];
        for (UIView *imgView in subScrollView.subviews) {
            if ([imgView isKindOfClass:[UIImageView class]]) {
                subImgView = (UIImageView*)imgView;
            }
        }
    }
 
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        subImgView.frame = self.sourceframe;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
   
}


- (void)ceverTap1:(UITapGestureRecognizer*)tapView{
    self.scrollView.alpha = 0;
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        self.iconImage.frame = self.sourceframe;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
}


- (UIImageView*)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.backgroundColor = [UIColor whiteColor];
        _iconImage.userInteractionEnabled = YES;
    }
    return _iconImage;
}

- (UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.delegate  =self;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.alpha = 0;
    }
    return _scrollView;
}

- (UIView*)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, 40)];
        
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 40, 40)];
//        [btn addTarget:self action:@selector(ceverTap) forControlEvents:UIControlEventTouchDown];
//        [btn setTitle:@"X" forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:22];
//        [btn setTitleColor:MM_APPBaseColor forState:UIControlStateNormal];
//        [_topView addSubview:btn];
        
        [_topView addSubview:self.indexLabel];
        [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_topView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
    }
    return _topView;
}

- (UILabel*)indexLabel{
    if (!_indexLabel) {
        _indexLabel = [UILabel new];
        _indexLabel.font = [UIFont systemFontOfSize:14];
        _indexLabel.textColor = [UIColor blackColor];
        _indexLabel.textAlignment = NSTextAlignmentCenter;
//        _indexLabel.backgroundColor = [UIColor redColor];
    }
    return _indexLabel;
}





@end
