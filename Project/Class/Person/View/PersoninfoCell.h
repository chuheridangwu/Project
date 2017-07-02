//
//  PersoninfoCell.h
//  Project
//
//  Created by 董玉毛 on 2017/6/18.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"
#define PersoninfoCellHeight  (120)
@protocol PersoninfoCellDelegate;
@interface PersoninfoCell : XBBaseTableViewCell
@property (nonatomic,weak)id <PersoninfoCellDelegate> delegate;
@end

@protocol PersoninfoCellDelegate <NSObject>

- (void)clickImgView;

@end
