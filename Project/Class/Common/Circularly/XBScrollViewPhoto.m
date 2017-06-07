//
//  XBScrollViewPhoto.m
//  ScrollPhoto
//
//  Created by dym on 16/12/16.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "XBScrollViewPhoto.h"
#import "XBWebImgManager.h"



#define XBScrollView_Width self.frame.size.width
#define XBScrollView_Height self.frame.size.height

@interface XBScrollViewPhoto ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *leftImage;
@property (nonatomic,strong)UIImageView *rightImage;
@property (nonatomic,strong)UIImageView *centerImage;

@property (nonatomic,copy)UIScrollView *scrollew;

@property (nonatomic,weak)NSTimer *timer;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)UIPageControl *page;
@property (nonatomic,strong)NSArray *imgsArray;
@end

@implementation XBScrollViewPhoto


+ (instancetype)scrollViewPhotoWithFrame:(CGRect)frame ImgsArray:(NSArray *)imgsArray clickPhontIndex:(phototBlock)photoIndex{
    return [[XBScrollViewPhoto alloc]initWithFrame:frame withImgsArray:imgsArray clickPhontIndex:photoIndex];
}

- (instancetype)initWithFrame:(CGRect)frame withImgsArray:(NSArray*)imgsArray clickPhontIndex:(phototBlock)photoIndex{
    if (self = [super initWithFrame:frame]) {
        self.index = 0;
        self.clickIndexBlcok = photoIndex;
        self.imgsArray = imgsArray;
        
        [self addSubview:self.scrollew];
        [self.scrollew addSubview:self.leftImage];
        [self.scrollew addSubview:self.centerImage];
        [self.scrollew addSubview:self.rightImage];
        
        //添加计时器
        self.AutoScrollDelay = 2;
        
        
        //对图片进行赋值
        if (imgsArray.count > 1) {
            [self addSubview:self.page];
            self.page.numberOfPages = imgsArray.count;
            [self.scrollew setContentSize:CGSizeMake(XBScrollView_Width * 3, XBScrollView_Height)];
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

-(void)setPlaceImage:(UIImage *)placeImage {
    _placeImage = placeImage;
    //对图片进行赋值
    if (self.imgsArray.count > 1) {
        [self imageWithLeftIndex:self.imgsArray.count -1 centent:0 right:self.index + 1];
    }else{
        [self imageWithLeftIndex:0 centent:0 right:0];
    }
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    self.page.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    self.page.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}


#pragma mark ------ 先随便写写，不进行深层封装
- (void)imageWithLeftIndex:(NSInteger)left centent:(NSInteger)centent right:(NSInteger)right{
//      NSLog(@"%ld>>>>>>>%ld>>>>>>>>%ld",left,centent,right);
    if ([self isNetworkResources]) {
        self.leftImage = [self setImageUrlNameWithIndex:left imgView:self.leftImage];
        self.centerImage = [self setImageUrlNameWithIndex:centent imgView:self.centerImage];
        self.rightImage = [self setImageUrlNameWithIndex:right imgView:self.rightImage];
    }else{
        self.leftImage.image = [self setImageNamewithindex:left];
        self.centerImage.image = [self setImageNamewithindex:centent];
        self.rightImage.image = [self setImageNamewithindex:right];
    }
    
    [self.scrollew setContentOffset:CGPointMake(XBScrollView_Width, 0)];
}


//本地图片
- (UIImage*)setImageNamewithindex:(NSInteger)index{
    UIImage *image = [UIImage imageNamed:self.imgsArray[index]];
    return image;
}

//网络图片
- (UIImageView *)setImageUrlNameWithIndex:(NSInteger)index imgView:(UIImageView*)imageView{
    
    //从内存缓存中取,如果没有使用占位图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgsArray[index]] placeholderImage:self.placeImage];
    return imageView;
}

//资源中是否含有网络图片
- (BOOL)isNetworkResources{
    if ([self.imgsArray.lastObject hasPrefix:@"http://"] || [self.imgsArray.lastObject hasPrefix:@"https://"]) {
        return YES;
    }
    return NO;
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
        [self changeImageWithoffset:scrollView.contentOffset.x];
    }
}

// 这里用偏移量来计算放什么数据
- (void)changeImageWithoffset:(CGFloat)offset{
    //滑到最后一张，继续向右滑动
    if (offset >= XBScrollView_Width * 2) {
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
    
    self.page.currentPage = self.index;
}


- (void)setUpTimer {
    if (self.AutoScrollDelay < 0.5) return;
    
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
    [blockSelf.scrollew setContentOffset:CGPointMake(blockSelf.scrollew.contentOffset.x + XBScrollView_Width, 0) animated:YES];
}

- (void)clickImgTap{
    self.clickIndexBlcok(self.index);
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
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImgTap)];
        [_scrollew addGestureRecognizer:tap];
    }
    return _scrollew;
}

- (UIImageView*)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,XBScrollView_Width , XBScrollView_Height)];
    }
    return _leftImage;
}

- (UIImageView*)centerImage{
    if (!_centerImage) {
        _centerImage = [[UIImageView alloc]initWithFrame:CGRectMake(XBScrollView_Width, 0,XBScrollView_Width , XBScrollView_Height)];
    }
    return _centerImage;
}

- (UIImageView*)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(XBScrollView_Width * 2, 0,XBScrollView_Width , XBScrollView_Height)];
    }
    return _rightImage;
}

- (UIPageControl*)page{
    if (!_page) {
        _page = [[UIPageControl alloc]initWithFrame:CGRectMake((XBScrollView_Width - 100) / 2, XBScrollView_Height - 30, 100, 10)];
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        _page.pageIndicatorTintColor = [UIColor whiteColor];
    }
    return _page;
}

@end
