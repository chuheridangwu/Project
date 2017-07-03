//
//  GoodsEvaluationVC.m
//  ManMao
//
//  Created by dym on 16/11/17.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GoodsEvaluationVC.h"
#import "GAGoodsCeverScrollView.h"
#import "StoreViewController.h"
#import "StoreInfoViewController.h"
#import "XBNavigationController.h"
#import "CommentViewController.h"


#import "GAGoodsEvaEntity.h"
#import "GoodsEvaModel.h"
#import "ShopInfoView.h"
#import "GAGoodsEvationCell.h"
#import "RFSegmentView.h"

#define Size self.view.frame.size

@interface GoodsEvaluationVC ()<UITableViewDelegate,UITableViewDataSource,GoodsEvaModelDelegate,GAGoodsEvationCellDelegate,RFSegmentViewDelegate>
@property (nonatomic,strong)GoodsEvaModel *GAEvaModel;
@property (nonatomic,strong) RFSegmentView * segmentControl;
@property (nonatomic,strong)StoreViewController *storeVC;

@property (nonatomic,strong)UIViewController *disMissVC;

@end

@implementation GoodsEvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.requestUrl = @"http://mapi.yjcp.com/api/gain/tenawardinfo?lotId=33&pageNum=1&sid=31000000000";
    
    self.storeVC = [[StoreViewController alloc]init];
    [self addChildViewController:self.storeVC];
    [self.view addSubview:_storeVC.view];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.GAEvaModel  lookGoodsEvaluationShopLive];

    CGFloat segWidth = 180;
    CGFloat segHeight = 30;
    self.segmentControl = [[RFSegmentView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-segWidth)/2,5, segWidth, segHeight) items:@[@"店铺",@"店铺动态"]];
    self.segmentControl.tintColor = [UIColor whiteColor];
    self.segmentControl.delegate = self;
    [self.navigationController.navigationBar addSubview:self.segmentControl];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.GAEvaModel.evaArrar.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GAGoodsEvationCell goodsEvationHeight:self.self.GAEvaModel.evaArrar[indexPath.row]];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GAGoodsEvationCell *cell = [GAGoodsEvationCell GAGoodsEvationCellWithTableView:tableView];
    if (self.GAEvaModel.evaArrar.count != 0) {
        cell.height = [GAGoodsEvationCell goodsEvationHeight:self.self.GAEvaModel.evaArrar[indexPath.row]];
        cell.entity = self.self.GAEvaModel.evaArrar[indexPath.row];
        [cell loadCell];
    }
    cell.delegate = self;
    return cell;
}

#pragma  mark ------ GAGoodsEvationCellDelegate 点击评价图片 ---------
-(void)clickGoodsEvationCellImgFrame:(CGRect)frame imgsURL:(NSArray *)imgsURL index:(NSInteger)index{
    [GAGoodsCeverScrollView hiddenImageViewFrame:frame imgs:imgsURL index:index ImgStyle:GAGoodsImgsStyle_ImgURL];
}

- (void)clickShopView:(GAGoodsEvaEntity *)entity{
//    [[ShopInfoView shareShopInfoView] showWithShopInfo:entity];
    
    CommentViewController *storeInfoVC = [[CommentViewController alloc]init];
    storeInfoVC.entity = entity;
    XBNavigationController *navVC = [[XBNavigationController alloc]initWithRootViewController:storeInfoVC];
    
    [self presentViewController:navVC animated:YES completion:nil];
    storeInfoVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消"  style:UIBarButtonItemStylePlain target:self action:@selector(clickCloseVC)];
    self.disMissVC = storeInfoVC;
}

- (void)clickCloseVC{
    [self.disMissVC dismissViewControllerAnimated:YES completion:nil];
}
- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
}



#pragma MARK    -----------   代理
- (void)segmentViewSelectIndex:(NSInteger)index{
    if (index == 0) {
        _storeVC.view.hidden = NO;
    }else{
        _storeVC.view.hidden = YES;
    }
}


- (void)GoodsEvaModelRequestNetWorkSucceed{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----- lazr Loading
- (GoodsEvaModel*)GAEvaModel{
    if (!_GAEvaModel) {
        _GAEvaModel = [[GoodsEvaModel alloc]init];
        _GAEvaModel.delegate  = self;
    }
    return _GAEvaModel;
}
@end
