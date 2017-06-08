//
//  HomeTopPhotoCell.m
//  Project
//
//  Created by 董玉毛 on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeTopPhotoCell.h"
#import "XBScrollViewPhoto.h"


@interface HomeTopPhotoCell ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIView *bottonView;
@property (nonatomic,strong)XBScrollViewPhoto *scrollView;

@end

@implementation HomeTopPhotoCell


- (void)loadCell{
    
    self.contentView.mj_h = 160;
    self.contentView.mj_w = [UIScreen mainScreen].bounds.size.width;
    
    [self.bottonView removeFromSuperview];
    self.bottonView = [[UIView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.bottonView];
    
    
    NSArray *imgArray = @[@"http://res.ailecp.com/images/activity/1.jpg",@"http://res.ailecp.com/images/activity/2.jpg",@"http://res.ailecp.com/images/activity/3.jpg",@"http://res.ailecp.com/images/activity/4.jpg",@"http://pimg1.126.net/caipiao_info/images/headFigure/appad/1496837158828_1.jpg",@"http://pimg1.126.net/caipiao_info/images/headFigure/appad/1495619418092_1.jpg"];
//    for (int i = 0; i < self.entity.rowArray.count; i++) {
//        CustominCenterEntity *rowEntity = self.entity.rowArray[i];
//        [imgArray addObject:rowEntity.imgURL];
//    }
    
    XBScrollViewPhoto *photo = [XBScrollViewPhoto scrollViewPhotoWithFrame:self.bottonView.bounds ImgsArray:imgArray clickPhontIndex:^(NSInteger clickIndex) {
//        CustominCenterEntity *rowEntity = self.entity.rowArray[clickIndex];
//        if ([self.delegate respondsToSelector:@selector(clickScrollViewImgViewEntity:)]) {
//            [self.delegate clickScrollViewImgViewEntity:rowEntity];
//        }
    }];
    photo.placeImage = [UIImage imageNamed:@"zhanwei"];
    photo.pageIndicatorTintColor = RGBColor(200, 200, 200);
    photo.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.bottonView addSubview:photo];
    
}

- (void)clickImgView:(UITapGestureRecognizer*)tapView{
//    CustominCenterEntity *rowEntity = self.entity.rowArray[tapView.view.tag];
   
}



@end
