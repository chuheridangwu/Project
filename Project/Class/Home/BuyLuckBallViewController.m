//
//  BuyLuckBallViewController.m
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BuyLuckBallViewController.h"

#import "BuyLuckBallCell.h"

#import "HomeLuckBallEntity.h"

@interface BuyLuckBallViewController ()<UITableViewDelegate,UITableViewDataSource,BuyLuckBallCellDelegate>

@property (nonatomic,strong)UIView *titView;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation BuyLuckBallViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _entity.name;
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *noticion = @"选号神器助您中大奖，下注会使用iOS系统内置的Safari浏览器打开9188官网，彩票开奖信息和下注信息与苹果公司无关";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64 - 40, SCREEN_WIDTH, 40)];
    [btn setTitle:@"投注" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = XBAPPBaseColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(clickBuyLuckball) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64 - 40 - 30, SCREEN_WIDTH, 30)];
    label.text = noticion;
    label.backgroundColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 20 - 40 - 30 - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = [BuyLuckBallCell cellheightWithInfo:_entity];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [BuyLuckBallCell cellheightWithInfo:_entity];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _entity.leaveArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BuyLuckBallCell *cell = [BuyLuckBallCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"BuyLuckBallCell"];
    cell.entity = _entity;
    [cell setTitleText:_entity.leaveArray[indexPath.row] withClickBtn:_entity.selearray[indexPath.row]];
    cell.delegate = self;
    return cell;
}


- (void)clickBuyLuckball{
    NSMutableString *message = [NSMutableString stringWithFormat:@"您选择的号码:\n"];
    for (NSString *str  in _entity.selearray) {
        [message appendString:[NSString stringWithFormat:@"  %@",str]];
    }
  
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"确定购买" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *canerl = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_entity.jumpURL]];
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:canerl];
    [self presentViewController:alertVC animated:YES completion:nil];
}


- (void)clickBtnText:(UIButton *)btn{
    UIView *superView = btn.superview;
    do{
        superView = superView.superview;
    }while (superView && ![superView isKindOfClass:[BuyLuckBallCell class]]);
    
    //改变每个分区cell是否被选中
    if(superView && [superView isKindOfClass:[BuyLuckBallCell class]]){
        //找到cell，改变bool值
        BuyLuckBallCell *cell = (BuyLuckBallCell*)superView;
        NSIndexPath *indexPath  =[self.tableView indexPathForCell:cell];
        [_entity.selearray replaceObjectAtIndex:indexPath.row withObject:btn.titleLabel.text];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

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
