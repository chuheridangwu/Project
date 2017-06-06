//
//  XBSettingCell.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBSettingCell.h"

#import "XBSwtichSettingItem.h"
#import "XBArrowSettingItem.h"


@interface XBSettingCell ()

@property (nonatomic, strong) UIImageView *arrowView;

@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation XBSettingCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style
{
    static NSString *ID = @"cell";
    
    XBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[XBSettingCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setItem:(XBSettingItem *)item
{
    _item = item;
    
    // 设置控件上的内容
    [self setUpData];
    
    // 设置辅助视图
    [self setUpAccessoryView];
    
    
    
}

- (void)setUpData
{
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.subTitle;
    self.imageView.image = _item.image;
}

- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[XBArrowSettingItem class]]) {
        // 箭头
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else if ([_item isKindOfClass:[XBSwtichSettingItem class]]){
        // 开关
        self.accessoryView = self.switchView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        // 还原
        self.accessoryView = nil;
    }
}

@end
