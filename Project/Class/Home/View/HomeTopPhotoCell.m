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
    
//    self.contentView.height = CIScrollerBigImgViewCellHeight;
//    self.width = [UIScreen mainScreen].bounds.size.width;
//    
//    [self.bottonView removeFromSuperview];
//    self.bottonView = [[UIView alloc]initWithFrame:self.bounds];
//    [self.contentView addSubview:self.bottonView];
//    
//    
//    NSMutableArray *imgArray = [NSMutableArray array];
//    for (int i = 0; i < self.entity.rowArray.count; i++) {
//        CustominCenterEntity *rowEntity = self.entity.rowArray[i];
//        [imgArray addObject:rowEntity.imgURL];
//    }
//    
//    XBScrollViewPhoto *photo = [XBScrollViewPhoto scrollViewPhotoWithFrame:self.bottonView.bounds ImgsArray:imgArray clickPhontIndex:^(NSInteger clickIndex) {
//        CustominCenterEntity *rowEntity = self.entity.rowArray[clickIndex];
//        if ([self.delegate respondsToSelector:@selector(clickScrollViewImgViewEntity:)]) {
//            [self.delegate clickScrollViewImgViewEntity:rowEntity];
//        }
//    }];
//    photo.placeImage = [UIImage imageNamed:@"zhanwei"];
//    photo.pageIndicatorTintColor = RGBColor(200, 200, 200);
//    photo.currentPageIndicatorTintColor = [UIColor whiteColor];
//    [self.bottonView addSubview:photo];
    
}

- (void)clickImgView:(UITapGestureRecognizer*)tapView{
//    CustominCenterEntity *rowEntity = self.entity.rowArray[tapView.view.tag];
   
}



@end
