//
//  XBRunCircleTextCell.m
//  Project
//
//  Created by dym on 2017/6/19.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBRunCircleTextCell.h"
#import "XBScrollViewLabel.h"

@interface XBRunCircleTextCell ()

@end


@implementation XBRunCircleTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        NSArray *array = @[@"恭喜136XXXX3245竞彩命中 12.23 万元",
                           @"恭喜136XXXX4232竞彩命中 1.23 万元",
                           @"恭喜156XXXX6435竞彩命中 12.54 万元",
                           @"恭喜186XXXX6254竞彩命中 11.53 万元",
                           @"恭喜186XXXX1245竞彩命中 10.74 万元",
                           @"恭喜176XXXX2375竞彩命中 12 万元",
                           @"恭喜166XXXX1275竞彩命中 11.3 万元",
                           @"恭喜126XXXX5246竞彩命中 1.1 万元",
                           ];
        UIImageView *iconImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lotteryhallmessage"]];
        iconImg.frame = CGRectMake(5, 0, self.mj_h, self.mj_h);
        iconImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconImg];
        XBScrollViewLabel *label = [XBScrollViewLabel scrollViewPhotoWithFrame:CGRectMake(CGRectGetMaxX(iconImg.frame), 0, self.mj_w - 60, self.mj_h) ImgsArray:array];
        [self.contentView addSubview:label];
    
    }
    return self;
}

@end
