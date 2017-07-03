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
        cell = [[NSClassFromString(idtifier) alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idtifier];
        if (!cell) {
            cell = [[XBBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idtifier];
        }
    }
    return cell;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}


- (UIView*)bottonView{
    if (!_bottonView) {
        _bottonView = [[UIView alloc]initWithFrame:self.bounds];
    }
    return _bottonView;
}


@end
