//
//  HomeSectionListCell.h
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

#define HomeSectionListCellHeight  (55)
@protocol HomeSectionListCellDelegate;
@interface HomeSectionListCell : XBBaseTableViewCell
@property (nonatomic,weak)id<HomeSectionListCellDelegate> delegate;
@end

@protocol HomeSectionListCellDelegate  <NSObject>

- (void)clickHomeSecitonListCellTag:(NSInteger)tag;

@end
