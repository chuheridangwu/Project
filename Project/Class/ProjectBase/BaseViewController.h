//
//  BaseViewController.h
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBRequestModel.h"

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,XBRequestModelDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSString *requestUrl;
@property (nonatomic,strong)NSMutableArray *dataList;
@property (nonatomic,strong)XBRequestModel *requestModel;

//下拉刷新
- (void)tableViewDownRefresh;
@end
