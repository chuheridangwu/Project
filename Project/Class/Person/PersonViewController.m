//
//  PersonViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "PersonViewController.h"
#import "GameViewController.h"
#import "DisViewController.h"
#import "MessageViewController.h"
#import "AboutViewController.h"
#import "LotteryNoticeVC.h"
#import "LotteryHelpVC.h"
#import "XBNavigationController.h"
#import "LoginViewController.h"
#import "PersoninfoCell.h"

@interface PersonViewController ()
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *imageArray;
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UINavigationController  *navVC=  [[XBNavigationController alloc]initWithRootViewController:[[LoginViewController alloc] init]];
//    navVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 100);
//    [self presentViewController:navVC animated:YES completion:nil];
    
    self.tableView.tableFooterView = [self tableViewFootView];
//   __block LoginViewController *loginVC = [[LoginViewController alloc]init];
//    [self.view addSubview:loginVC.view];
//    [self addChildViewController:loginVC];
//    loginVC.myBlock = ^(){
//        [loginVC removeFromParentViewController];
//        [loginVC.view removeFromSuperview];
//    };
    
    
    self.titleArray = @[@"消息中心",@"开奖推送",@"开奖记录",@"关于",@"清除缓存"];
//    self.imageArray = @[@"message",@"notice",@"prize",@"game",@"about",@"clear"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"帮助" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
}

- (void)clickRightBtn{
    LotteryHelpVC *helpVC = [[LotteryHelpVC alloc]init];
    [self.navigationController pushViewController:helpVC animated:YES];
}

- (UIView*)tableViewFootView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH - 40, view.mj_h - 20)];
    btn.backgroundColor = XBAPPBaseColor;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setBorderRadian:5 width:0 color:[UIColor clearColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:btn];
    return view;
}

- (void)clickBtn{
    __block LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.view addSubview:loginVC.view];
    [self addChildViewController:loginVC];
    loginVC.myBlock = ^(){
        [loginVC removeFromParentViewController];
        [loginVC.view removeFromSuperview];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return PersoninfoCellHeight;
    }
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 20;
    }
    return 00000.1;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"2323";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        if (indexPath.section == 0) {
            cell = [PersoninfoCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"PersoninfoCell"];
        }else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",self.titleArray[indexPath.row]];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
        }
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 1) {
        [self didSelectRow:indexPath.row];
    }
}

- (void)didSelectRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            MessageViewController *message = [[MessageViewController alloc]init];
            [message setNoneDataBackImage:@"" explain:@"您还没有收到消息"];
            [self.navigationController pushViewController:message animated:YES];
        }
            break;
        case 1:
        {
            LotteryNoticeVC *disVC = [[LotteryNoticeVC alloc]init];
            [self.navigationController pushViewController:disVC animated:YES];
        }
            break;
        case 2:
        {
            DisViewController *disVC = [[DisViewController alloc]init];
            disVC.title = @"开奖记录";
            [self.navigationController pushViewController:disVC animated:YES];
        }
            break;
        case 3:
        {
            AboutViewController *gameVC = [[AboutViewController alloc]init];
            [self.navigationController pushViewController:gameVC animated:YES];
        }
            break;
        case 4:
        {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要清楚缓存" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *carcen = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [XBUITool showRmindView:@"清除缓存成功"];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertVC addAction:carcen];
            [alertVC addAction:cancel];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
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
