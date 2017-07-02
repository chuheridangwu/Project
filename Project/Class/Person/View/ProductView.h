//
//  ProductView.h
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProductViewDelegate;
@interface ProductView : UIView
@property (nonatomic,weak)id<ProductViewDelegate> delegate;

- (void)setPrict:(NSArray*)priceArray  withSaleArray:(NSArray*)saleArray;
@end

@protocol ProductViewDelegate <NSObject>

- (void)clickBtnCartInfoWithIndex:(NSInteger)tag;
@end
