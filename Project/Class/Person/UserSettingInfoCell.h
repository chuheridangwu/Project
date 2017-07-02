//
//  UserSettingInfoCell.h
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

@interface UserSettingInfoCell : XBBaseTableViewCell

- (void)setNameText:(NSString*)name titleText:(NSString*)text;

- (void)setisOpen:(BOOL)open;
@end
