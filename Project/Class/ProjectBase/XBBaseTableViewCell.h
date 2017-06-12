//
//  XBBaseTableViewCell.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBBaseTableViewCell : UITableViewCell
@property (nonatomic,strong)UIView *bottonView;
+ (instancetype)tableViewCellInitializeWithTableView:(UITableView*)tableView  withIdtifier:(NSString*)idtifier;
@end
