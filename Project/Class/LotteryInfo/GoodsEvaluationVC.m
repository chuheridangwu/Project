//
//  GoodsEvaluationVC.m
//  ManMao
//
//  Created by dym on 16/11/17.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GoodsEvaluationVC.h"
#import "GAGoodsCeverScrollView.h"
#import "GoodsEvaModel.h"
#import "ShopInfoView.h"
#import "GAGoodsEvationCell.h"

#define Size self.view.frame.size

@interface GoodsEvaluationVC ()<UITableViewDelegate,UITableViewDataSource,GoodsEvaModelDelegate,GAGoodsEvationCellDelegate>
@property (nonatomic,strong)GoodsEvaModel *GAEvaModel;
@end

@implementation GoodsEvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.requestUrl = @"http://mapi.yjcp.com/api/gain/tenawardinfo?lotId=33&pageNum=1&sid=31000000000";
//    self.title = @"店铺信息";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.GAEvaModel  lookGoodsEvaluationShopLive];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.GAEvaModel.evaArrar.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GAGoodsEvationCell goodsEvationHeight:self.self.GAEvaModel.evaArrar[indexPath.row]];
//    return 120;
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
    [[ShopInfoView shareShopInfoView] showWithShopInfo:entity];
//    [[StoreInfoView shareShopInfoView]showWithShopInfo:entity];
}

- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
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
