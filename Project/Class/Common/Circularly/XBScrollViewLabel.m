//
//  XBScrollViewPhoto.m
//  ScrollPhoto
//
//  Created by dym on 16/12/16.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "XBScrollViewLabel.h"



#define XBScrollView_Width self.frame.size.width
#define XBScrollView_Height self.frame.size.height

@interface XBScrollViewLabel ()<UIScrollViewDelegate>
@property (nonatomic,strong)UILabel *leftImage;
@property (nonatomic,strong)UILabel *rightImage;
@property (nonatomic,strong)UILabel *centerImage;

@property (nonatomic,copy)UIScrollView *scrollew;

@property (nonatomic,weak)NSTimer *timer;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSArray *imgsArray;
@end

@implementation XBScrollViewLabel


+ (instancetype)scrollViewPhotoWithFrame:(CGRect)frame ImgsArray:(NSArray *)imgsArray{
    return [[XBScrollViewLabel alloc]initWithFrame:frame withImgsArray:imgsArray ];
}

- (instancetype)initWithFrame:(CGRect)frame withImgsArray:(NSArray*)imgsArray{
    if (self = [super initWithFrame:frame]) {
        self.index = 0;
        self.imgsArray = imgsArray;
        
        [self addSubview:self.scrollew];
        [self.scrollew addSubview:self.leftImage];
        [self.scrollew addSubview:self.centerImage];
        [self.scrollew addSubview:self.rightImage];
        
        //添加计时器
        self.AutoScrollDelay = 2;
        
        
        //对图片进行赋值
        if (imgsArray.count > 1) {
           [self.scrollew setContentSize:CGSizeMake(XBScrollView_Width, XBScrollView_Height * 3)];
            [self imageWithLeftIndex:imgsArray.count -1 centent:0 right:self.index + 1];
        }else{
            [self imageWithLeftIndex:0 centent:0 right:0];
        }
    }
    return self;
}

-(void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay{
    _AutoScrollDelay = AutoScrollDelay;
    [self removeTimer];
    [self setUpTimer];
}




#pragma mark ------ 先随便写写，不进行深层封装
- (void)imageWithLeftIndex:(NSInteger)left centent:(NSInteger)centent right:(NSInteger)right{
//      NSLog(@"%ld>>>>>>>%ld>>>>>>>>%ld",left,centent,right);
        self.leftImage.text = [self setImageNamewithindex:left];
        self.centerImage.text = [self setImageNamewithindex:centent];
        self.rightImage.text = [self setImageNamewithindex:right];
    
    [self.scrollew setContentOffset:CGPointMake(0, XBScrollView_Height)];
}


//本地图片
- (NSString*)setImageNamewithindex:(NSInteger)index{
    NSString *image = self.imgsArray[index];
    return image;
}


#pragma mark --- UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setUpTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.imgsArray.count > 1) {
        [self changeImageWithoffset:scrollView.contentOffset.y];
    }
}

// 这里用偏移量来计算放什么数据
- (void)changeImageWithoffset:(CGFloat)offset{
    //滑到最后一张，继续向右滑动
    if (offset >= XBScrollView_Height * 2) {
        self.index++;
        if (self.index == self.imgsArray.count - 1) { //最后一张图片
            [self imageWithLeftIndex:self.index - 1 centent:self.index right:0];
        }else if (self.index == self.imgsArray.count){//当是第一张的时候
            self.index = 0;
            [self imageWithLeftIndex:self.imgsArray.count - 1 centent:0 right:self.index + 1];
        }else{ //正常的轮播
            [self imageWithLeftIndex:self.index - 1 centent:self.index right:self.index + 1];
        }
    }
    
    //在第一张的时候向左滑动
    if(offset <= 0){
        self.index--;
        if (self.index == 0) {//第一张的时候
            [self imageWithLeftIndex:self.imgsArray.count - 1 centent:self.index right:self.index + 1];
        }else if (self.index == -1){
            self.index = self.imgsArray.count - 1;
            [self imageWithLeftIndex:self.index - 1 centent:self.index right:0];
        }else{
            [self imageWithLeftIndex:self.index - 1 centent:self.index right:self.index + 1];
        }
    }
}


- (void)setUpTimer {
    if (self.AutoScrollDelay < 0.1) return;
    
    if (self.imgsArray.count > 1) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.AutoScrollDelay target:self selector:@selector(clickTime) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
  
}

- (void)removeTimer {
    if (self.timer == nil) return;
    [self.timer invalidate];
    self.timer = nil;
}

- (void)clickTime{
    __unsafe_unretained __typeof(self) blockSelf = self;
    [blockSelf.scrollew setContentOffset:CGPointMake(0, blockSelf.scrollew.contentOffset.y + XBScrollView_Height) animated:YES];
}



-(void)dealloc {
    [self removeTimer];
}

#pragma mark --- lazy
- (UIScrollView*)scrollew{
    if (!_scrollew) {
        _scrollew = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollew.showsVerticalScrollIndicator = NO;
        _scrollew.showsHorizontalScrollIndicator = NO;
        _scrollew.delegate = self;
        _scrollew.pagingEnabled = YES;
    }
    return _scrollew;
}

- (UILabel*)leftImage{
    if (!_leftImage) {
        _leftImage = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,XBScrollView_Width , XBScrollView_Height)];
        _leftImage.font = [UIFont systemFontOfSize:14];
        _leftImage.textAlignment = NSTextAlignmentCenter;

    }
    return _leftImage;
}

- (UILabel*)centerImage{
    if (!_centerImage) {
        _centerImage = [[UILabel alloc]initWithFrame:CGRectMake(0,XBScrollView_Height,XBScrollView_Width , XBScrollView_Height)];
        _centerImage.font = [UIFont systemFontOfSize:14];
        _centerImage.textAlignment = NSTextAlignmentCenter;
    }
    return _centerImage;
}

- (UILabel*)rightImage{
    if (!_rightImage) {
        _rightImage = [[UILabel alloc]initWithFrame:CGRectMake(0 , XBScrollView_Height * 2,XBScrollView_Width , XBScrollView_Height)];
        _rightImage.font = [UIFont systemFontOfSize:14];
        _rightImage.textAlignment = NSTextAlignmentCenter;
    }
    return _rightImage;
}

@end
