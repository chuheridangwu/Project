//
//  GAGoodsEvationCell.h
//  ManMao
//
//  Created by dym on 16/11/18.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GAGoodsEvaEntity;
@protocol GAGoodsEvationCellDelegate;
@interface GAGoodsEvationCell : UITableViewCell
@property (nonatomic,strong)id<GAGoodsEvationCellDelegate> delegate;
@property (nonatomic,strong)GAGoodsEvaEntity *entity;

- (void)loadCell;
+ (instancetype)GAGoodsEvationCellWithTableView:(UITableView*)tableView;
+ (CGFloat)goodsEvationHeight:(id)info;
@end

@protocol GAGoodsEvationCellDelegate <NSObject>
- (void)clickGoodsEvationCellImgFrame:(CGRect)frame imgsURL:(NSArray*)imgsURL index:(NSInteger)index;
- (void)clickShopView;
@end
