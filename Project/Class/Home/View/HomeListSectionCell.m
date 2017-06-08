//
//  HomeListSectionCell.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeListSectionCell.h"
#import "HomeDataEntity.h"
#import "ProductDisplayView.h"

@interface HomeListSectionCell ()<ProductDisplayViewDelegate>
{
    UIView *conteView;

}
@end

@implementation HomeListSectionCell

- (void)setArray:(NSArray *)array{
    self.mj_w = SCREEN_WIDTH;
    _array = array;
    [conteView removeFromSuperview];
    conteView = [[UIView alloc]initWithFrame:self.bounds];
    conteView.backgroundColor = RGBColor(243, 243, 243);
    [self.contentView addSubview:conteView];
    
    CGFloat width = SCREEN_WIDTH / 2;
    CGFloat height =self.frame.size.height;
    for (int i = 0; i < array.count; i++) {
        CGFloat X = 0 + i *  (3 + width);
        ProductDisplayView *view = [[ProductDisplayView alloc]initWithFrame:CGRectMake(X, 0, width, height)];
        view.model = array[i];
        view.delegate = self;
        [conteView addSubview:view];
    }
}

- (void)ProductDisplayViewWith:(HomeDataEntity*)model{
    [self.delegate clickHomeListSectionCell:model];
}

@end
