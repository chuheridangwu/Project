//
//  HomeSectionListCell.m
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeSectionListCell.h"
#import "UIView+Render.h"

#define  margin (10)

@implementation HomeSectionListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.mj_w = SCREEN_WIDTH;
        self.mj_h = HomeSectionListCellHeight;
        CGFloat ImgBtnHeight = self.frame.size.height - 8;
        
        for (int i = 0; i < 3; i ++) {
            NSArray *textArr = @[@"活动",@"比分",@"走势",@"客服"];
            NSArray *imgArr = @[@"img_home_header_activity.png",@"img_home_header_index.png",@"img_home_header_score.png",@"img_home_header_service.png"];
            NSArray *colorArray = @[RGBColor(106, 203, 150),RGBColor(226, 113, 162),RGBColor(236, 145, 87),RGBColor(158, 130, 231)];
            NSInteger rowCount = 4;
            CGFloat width = (self.frame.size.width - 3)  / rowCount;
            CGFloat baseHeight = ImgBtnHeight;
            
            for (int i  = 0; i < textArr.count; i++) {
                int row = i / rowCount;
                int col = i % rowCount;
                CGFloat  baseX = col * (width + 1);
                CGFloat baseY = row * (baseHeight);
                UIButton *commonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [commonBtn setBackgroundColor:[UIColor whiteColor]];
                commonBtn.frame = CGRectMake(baseX,baseY, width, baseHeight);
                [commonBtn setBorderRadian:0 width:1 color:[UIColor clearColor]];
                commonBtn.tag = i;
                [commonBtn setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
                [commonBtn setTitle:textArr[i] forState:UIControlStateNormal];
                [commonBtn setTitleColor:colorArray[i] forState:UIControlStateNormal];
                [commonBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
                [commonBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:commonBtn];
                
                CGPoint buttonBoundsCenter = CGPointMake(CGRectGetMidX(commonBtn.bounds), CGRectGetMidY(commonBtn.bounds));
                CGPoint endImageViewCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetMidY(commonBtn.imageView.bounds));
                CGPoint endTitleLabelCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetHeight(commonBtn.bounds)-CGRectGetMidY(commonBtn.titleLabel.bounds));
                CGPoint startImageViewCenter = commonBtn.imageView.center;
                CGPoint startTitleLabelCenter = commonBtn.titleLabel.center;
                CGFloat imageEdgeInsetsLeft = endImageViewCenter.x - startImageViewCenter.x;
                CGFloat imageEdgeInsetsRight = -imageEdgeInsetsLeft;
                commonBtn.imageEdgeInsets = UIEdgeInsetsMake(0, imageEdgeInsetsLeft, 12, imageEdgeInsetsRight);
                CGFloat titleEdgeInsetsLeft = endTitleLabelCenter.x - startTitleLabelCenter.x;
                CGFloat titleEdgeInsetsRight = -titleEdgeInsetsLeft;
                commonBtn.titleEdgeInsets = UIEdgeInsetsMake(ImgBtnHeight-12, titleEdgeInsetsLeft, 0, titleEdgeInsetsRight);
                
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(baseX + commonBtn.mj_w, 0, 1, self.mj_h)];
                [self.contentView addSubview:view];
                view.backgroundColor = RGBColor(236, 236, 236);
            }
        
        }
    }
    return self;
}

- (void)buttonClicked:(UIButton*)btn{
    if ([self.delegate respondsToSelector:@selector(clickHomeSecitonListCellTag:)]) {
        [self.delegate clickHomeSecitonListCellTag:btn.tag];
    }
}
@end
