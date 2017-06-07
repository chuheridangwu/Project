//
//  XBBaseTableViewCell.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

@implementation XBBaseTableViewCell

+ (instancetype)tableViewCellInitializeWithTableView:(UITableView*)tableView  withIdtifier:(NSString*)idtifier{
    XBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idtifier];
    if (!cell) {
        cell = [[NSClassFromString(idtifier) alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idtifier];
        if (!cell) {
            cell = [[XBBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idtifier];
        }
    }
    return cell;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}

@end
