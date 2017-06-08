//
//  XBTabBarController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBTabBarController.h"
#import "XBNavigationController.h"
#import "XBTabBar.h"

#import "HomeViewController.h"
#import "OneBuyViewController.h"
#import "PersonViewController.h"
#import "DisViewController.h"
#import "FoundViewController.h"


@interface XBTabBarController ()<XBTabBarDelegate>
// 保存所有控制器对应按钮的内容（UITabBarItem）
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation XBTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 把系统的tabBar上的按钮干掉
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[XBTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAllChildViewController];
    
    [self setUpTabBar];
}

#pragma mark - 自定义tabBar
- (void)setUpTabBar
{
    XBTabBar *tabBar = [[XBTabBar alloc] init];
    
    // 存储UITabBarItem
    tabBar.items = self.items;
    
    tabBar.delegate = self;
    
    tabBar.backgroundColor = [UIColor orangeColor];
    
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
    
}

#pragma mark - 添加所有子控制器
// tabBar上面按钮的图片尺寸是由规定，不能超过44
- (void)setUpAllChildViewController
{
    // 购彩大厅
    HomeViewController *hall = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];

    // 竞技场
    OneBuyViewController *arena = [[OneBuyViewController alloc] init];
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    arena.view.backgroundColor = [UIColor purpleColor];
    
    
    // 发现
    FoundViewController *discover = [[FoundViewController alloc]init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 开奖信息
    DisViewController *history = [[DisViewController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 我的彩票
    PersonViewController *myLottery = [[PersonViewController alloc] init];
    [self setUpOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}


#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    
    vc.navigationItem.title = title;
    
    // 描述对应按钮的内容
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    // 记录所有控制器对应按钮的内容
    [self.items addObject:vc.tabBarItem];
    
    // 把控制器包装成导航控制器
    UINavigationController *nav = [[XBNavigationController alloc] initWithRootViewController:vc];
    
    // 如果要设置背景图片，必须填UIBarMetricsDefault,默认导航控制器的子控制器的view尺寸会变化。
    // 设置导航条背景图片，一定要在导航条显示之前设置
    //    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    [self addChildViewController:nav];
}

- (void)tabBar:(XBTabBar *)tabBar didClickBtn:(NSInteger)index{
     self.selectedIndex = index;
}

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

/**          另一种一种方法       **/
/*
- (void)addChildControllers{
    HomeViewController * homeVC = [[HomeViewController alloc] init];
    [self addChildVC:homeVC vcTitle:@"首页" tabBarItemTitle:@"首页" image:@"TabBar_LotteryHall_new" selectedImage:@"TabBar_LotteryHall_selected_new"];
    
    OneBuyViewController *teamVC = [[OneBuyViewController alloc] init];
    [self addChildVC:teamVC vcTitle:@"一元购" tabBarItemTitle:@"一元购" image:@"tuandui" selectedImage:@"tuanduiD"];
    
    DisViewController * memberCenterVC = [[DisViewController alloc] init];
    [self addChildVC:memberCenterVC vcTitle:@"开奖记录" tabBarItemTitle:@"开奖" image:@"TabBar_History_new" selectedImage:@"TabBar_History_selected_new"];
    
    PersonViewController *personVC = [[PersonViewController alloc] init];
    [self addChildVC:personVC vcTitle:@"个人中心" tabBarItemTitle:@"个人中心" image:@"TabBar_MyLottery_new" selectedImage:@"TabBar_MyLottery_selected_new"];
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
                               
  */
                               
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
