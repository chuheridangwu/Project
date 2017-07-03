//
//  MessageWenVC.m
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MessageWenVC.h"

@interface MessageWenVC ()<UIWebViewDelegate,UIScrollViewDelegate>
//@property (nonatomic,strong)UIWebView *webView;
@end

@implementation MessageWenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息详情";
    self.view.backgroundColor = RGBColor(240, 240, 240);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 180)];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = RGBColor(240, 240, 240);
    label.textColor = RGBColor(150, 150, 150);
    label.numberOfLines = 0;
    label.text = @"      欢迎使用时时彩APP \n  本软件是最值得信赖的专业彩票软件,为彩民提供双色球,大乐透,3D,11选5,足彩,竞彩,等众多彩种,中奖福地,买彩票首选!   \n   “彩票，奖券的通称。”“奖券，一种证券，上面编有号码，按票面价格出售。开奖后，持有中奖号码奖券的，可按规定领奖。” 彩票是一种以筹集资金为目的发行的，印有号码、图形、文字、面值的，由购买人自愿按一定规则购买并确定是否获取奖励的凭证";
    
    
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
