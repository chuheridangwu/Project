//
//  BuyViewController.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BuyViewController.h"
#import "DLTabedSlideView.h"
#import "BaseViewController.h"

enum{
    OrderList_All = 0,
    OrderList_Wait_Pay,
    OrderList_Wait_Send,
    
    OrderList_Invalid
};

@interface BuyViewController ()<DLTabedSlideViewDelegate>{
    DLTabedSlideView *tabedSlideView;
    NSInteger showNumber;
}


@end

@implementation BuyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"购彩记录";
    
    tabedSlideView = [[DLTabedSlideView alloc] init];
    tabedSlideView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    [tabedSlideView setDelegate:self];
    
    [tabedSlideView setBaseViewController:self];
    [tabedSlideView setTabItemNormalColor:[UIColor blackColor]];
    [tabedSlideView setTabItemSelectedColor:XBAPPBaseColor];
    [tabedSlideView setTabbarTrackColor:XBAPPBaseColor];
    [tabedSlideView setTabbarBottomSpacing:3.0];
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"未付款" image:nil selectedImage:nil];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"待出奖" image:nil selectedImage:nil];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"已出奖" image:nil selectedImage:nil];
    
    [tabedSlideView setTabbarItems:@[item1,item2,item3]];
    [tabedSlideView buildTabbar];
    
    showNumber = [tabedSlideView.tabbarItems count];
    
    tabedSlideView.selectedIndex = 0;
    [self.view addSubview:tabedSlideView];
    
}


-(NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender{
    return showNumber;
}

-(UIViewController*)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index{
    switch (index) {
        case OrderList_All:
        {
            BaseViewController *listAll = [[BaseViewController alloc] init];
            UIView* noneView = [[UIView alloc]initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH - 20, 120)];
            UIImageView *imageView = [UIImageView new];
            imageView.image = [UIImage imageNamed:@"shopEmpty"];
            imageView.contentMode = UIViewContentModeCenter;
            [noneView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.equalTo(0);
                make.height.equalTo(noneView.height).multipliedBy(0.5);
            }];
            
            UILabel *label = [UILabel new];
            label.text = @"暂无充值记录";
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            [noneView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(0);
                make.top.equalTo(imageView.mas_bottom).offset(0);
            }];
            
            [listAll.view addSubview:noneView];
            return listAll;
        }
            break;
        case OrderList_Wait_Pay:
        {
            BaseViewController *payList = [[BaseViewController alloc] init];
            UIView* noneView = [[UIView alloc]initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH - 20, 120)];
            UIImageView *imageView = [UIImageView new];
            imageView.image = [UIImage imageNamed:@"shopEmpty"];
            imageView.contentMode = UIViewContentModeCenter;
            [noneView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.equalTo(0);
                make.height.equalTo(noneView.height).multipliedBy(0.5);
            }];
            
            UILabel *label = [UILabel new];
            label.text = @"暂无充值记录";
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            [noneView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(0);
                make.top.equalTo(imageView.mas_bottom).offset(0);
            }];
            
            [payList.view addSubview:noneView];
            return payList;
        }
            break;
        case OrderList_Wait_Send:
        {
            BaseViewController *sendList = [[BaseViewController alloc] init];
            UIView* noneView = [[UIView alloc]initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH - 20, 120)];
            UIImageView *imageView = [UIImageView new];
            imageView.image = [UIImage imageNamed:@"shopEmpty"];
            imageView.contentMode = UIViewContentModeCenter;
            [noneView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.equalTo(0);
                make.height.equalTo(noneView.height).multipliedBy(0.5);
            }];
            
            UILabel *label = [UILabel new];
            label.text = @"暂无充值记录";
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor grayColor];
            label.textAlignment = NSTextAlignmentCenter;
            [noneView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(0);
                make.top.equalTo(imageView.mas_bottom).offset(0);
            }];
            
            [sendList.view addSubview:noneView];
            return sendList;
        }
            break;
        default:
            break;
    }
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
