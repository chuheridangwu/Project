//
//  UserSettingImageCell.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "UserSettingImageCell.h"

@implementation UserSettingImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.mj_h = UserSettingImageCellHeight;
        self.mj_w = SCREEN_WIDTH;
        
        UILabel *nameL = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 120, self.mj_h)];
        [self.contentView addSubview:nameL];
        nameL.text = @"头像";
        nameL.font =[UIFont systemFontOfSize:15];
        
        CGFloat height = 50;
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.mj_w - height - 30, (self.mj_h - height) / 2, height, height)];
        imgView.image = [UIImage imageNamed:@"timg"];
        imgView.layer.cornerRadius = imgView.mj_h / 2;
        imgView.layer.masksToBounds = YES;
        [self.contentView  addSubview:imgView];
        imgView.userInteractionEnabled = YES;
    }
    return self;
}
@end
