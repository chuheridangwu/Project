//
//  XBTabBarController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBTabBarController.h"
#import "XBNavigationController.h"
#import "HomeViewController.h"
#import "OneBuyViewController.h"
#import "PersonViewController.h"
#import "DisViewController.h"


@interface XBTabBarController ()

@end

@implementation XBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildControllers];
}

- (void)addChildControllers{
    
    HomeViewController * homeVC = [[HomeViewController alloc] init];
    [self addChildVC:homeVC vcTitle:@"首页" tabBarItemTitle:@"首页" image:@"shouye" selectedImage:@"shouyeD"];
    
    OneBuyViewController *teamVC = [[OneBuyViewController alloc] init];
    [self addChildVC:teamVC vcTitle:@"一元购" tabBarItemTitle:@"一元购" image:@"tuandui" selectedImage:@"tuanduiD"];
    
    PersonViewController *personVC = [[PersonViewController alloc] init];
    [self addChildVC:personVC vcTitle:@"个人中心" tabBarItemTitle:@"个人中心" image:@"gouwu" selectedImage:@"gouwuD"];
    
    //    MemberCenterVC * memberCenterVC = [[MemberCenterVC alloc] init];
    //    [self addChildVC:memberCenterVC vcTitle:@"会员中心" tabBarItemTitle:@"会员中心" image:@"gerenCenter" selectedImage:@"gerenCenterD"];
}


-(void)addChildVC:(UIViewController *)childVC vcTitle:(NSString *)vcTitle tabBarItemTitle:(NSString *)tabBarItemTitle image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.title = vcTitle;
    childVC.tabBarItem.title = tabBarItemTitle;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//保证图片点击之后不变颜色
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:3];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName : XBAPPBaseColor} forState:UIControlStateSelected];//设置文字选中时的颜色UIControlStateSelected
    
    XBNavigationController * mainVC = [[XBNavigationController alloc] initWithRootViewController:childVC];
    mainVC.navigationBar.translucent = NO;//导航栏 默认是半透明的。透明不透明是会影响高度的终止位置的
    [self addChildViewController:mainVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
