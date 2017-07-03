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
#import "UserSettingController.h"
#import "ProductViewController.h"
#import "BuyViewController.h"




#import "PersoninfoCell.h"

@interface PersonViewController ()<PersoninfoCellDelegate>
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *imageArray;

@property (nonatomic,strong)NSArray *title1Array;
@property (nonatomic,strong)NSArray *image1Array;

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

    self.title1Array = @[@"充值中心",@"购彩记录"];
    self.image1Array = @[@"UserMoneyImg",@"OrderListImg"];

    self.titleArray = @[@"消息中心",@"开奖推送",@"关于"];
    self.imageArray = @[@"message",@"message1",@"AboutWxImg"];

}

- (void)clickRightBtn{
    LotteryHelpVC *helpVC = [[LotteryHelpVC alloc]init];
    [self.navigationController pushViewController:helpVC animated:YES];
}

- (UIView*)tableViewFootView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, SCREEN_WIDTH - 40, view.mj_h - 20)];
    btn.backgroundColor = XBAPPBaseColor;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setBorderRadian:5 width:0 color:[UIColor clearColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:btn];
    return view;
}

- (void)clickBtn{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    __block LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.view addSubview:loginVC.view];
    [self addChildViewController:loginVC];
    loginVC.myBlock = ^(){
        [loginVC removeFromParentViewController];
        [loginVC.view removeFromSuperview];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return PersoninfoCellHeight;
    }
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 ) {
        return 1;
    }else if (section == 1){
        return 2;
    }
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 10;
    }
    return 00000.1;
}

- (UITableViewCell*)UserInfoCell{
    PersoninfoCell *cell1 = [PersoninfoCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"PersoninfoCell"];
    cell1.delegate = self;
    cell1.mj_h = PersoninfoCellHeight;
    return cell1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"2323";
    UITableViewCell *cell;
    if (!cell) {
        if (indexPath.section == 0) {
            cell = [self UserInfoCell];
        }else if(indexPath.section == 1){
            cell = [tableView dequeueReusableCellWithIdentifier:str];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            cell.textLabel.text = [NSString stringWithFormat:@"%@",self.title1Array[indexPath.row]];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.imageView.image = [UIImage imageNamed:self.image1Array[indexPath.row]];
        }else{
            cell = [tableView dequeueReusableCellWithIdentifier:str];
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
        if (indexPath.row == 0) {
            [self payMoney];
        }else{
            [self buyProductHistory];
        }
    }else if (indexPath.section == 2){
        [self didSelectRow:indexPath.row];

    }
}


- (void)buyProductHistory{
    BuyViewController *buyVC = [[BuyViewController alloc]init];
    [self.navigationController pushViewController:buyVC animated:YES];
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
            AboutViewController *gameVC = [[AboutViewController alloc]init];
            [self.navigationController pushViewController:gameVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}


- (void)clickImgView{
    UserSettingController *setvc = [[UserSettingController alloc]init];
    [self.navigationController pushViewController:setvc animated:YES];
}



#pragma mark   ------   支付
- (void)payMoney{
    ProductViewController *productVC = [[ProductViewController alloc]init];
    [self.navigationController pushViewController:productVC animated:YES];
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
