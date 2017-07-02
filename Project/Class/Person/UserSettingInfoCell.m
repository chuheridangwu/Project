//
//  UserSettingInfoCell.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "UserSettingInfoCell.h"

@interface UserSettingInfoCell ()
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *titleL;
@end

@implementation UserSettingInfoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.mj_w = SCREEN_WIDTH;
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.titleL];
     
    }
    return self;
}


- (void)setNameText:(NSString*)name titleText:(NSString*)text{
    _nameL.text = name;
    _titleL.text = text;
 
}

- (void)setisOpen:(BOOL)open{
    if (open) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, self.mj_h)];
        _nameL.font =[UIFont systemFontOfSize:15];
    }
    return _nameL;
}

- (UILabel*)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 0, 100, self.mj_h)];
        _titleL.font =[UIFont systemFontOfSize:12];
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.textColor = [UIColor grayColor];
    }
    return _titleL;
}

@end
