//
//  XBNavigationController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBNavigationController.h"

@interface XBNavigationController ()
@end

@implementation XBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 0){
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Main_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
        backItem.tintColor = XBAPPBaseColor;
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [super pushViewController:viewController animated:animated];
}


-(void)popSelf
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
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
