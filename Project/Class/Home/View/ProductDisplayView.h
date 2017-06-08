//
//  ProductDisplayView.h
//  ManMao
//
//  Created by DYM on 16/7/1.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeDataEntity;
@protocol ProductDisplayViewDelegate;

@interface ProductDisplayView : UIView
@property (nonatomic,assign)BOOL isOpen;
@property (nonatomic,strong)HomeDataEntity *model;
@property (nonatomic,weak)id<ProductDisplayViewDelegate> delegate;
@end

@protocol ProductDisplayViewDelegate <NSObject>
- (void)ProductDisplayViewWith:(HomeDataEntity*)model;
@end
