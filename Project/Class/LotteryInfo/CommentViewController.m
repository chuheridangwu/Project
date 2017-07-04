//
//  CommentViewController.m
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "CommentViewController.h"
#import "SubmitCommentVC.h"

#import "CommentEntity.h"
#import "GAGoodsEvationCell.h"
#import "CommentShopCell.h"

#import "TSShareHelper.h"
#import "UserAttention.h"



@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource,UserAttentionDelegate,GAGoodsEvationCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataList;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评论详情";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    WS(ws);
    [XBUITool asRequestNetWork:^{
        ws.dataList = [self randomArray];
        [ws.tableView reloadData];
    }];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UserAttention *collectView = [[UserAttention alloc]initWithFrame:CGRectZero];
    collectView.delegate = self;
    [self.view addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.equalTo(@40);
    }];
    
 
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return  0.001;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [GAGoodsEvationCell goodsEvationHeight:self.entity];
    }
    return [CommentShopCell goodsEvationHeight:self.dataList[indexPath.row]];
}

- (UITableViewCell*)tableViewSectionStartCell{
    GAGoodsEvationCell *cell = [GAGoodsEvationCell GAGoodsEvationCellWithTableView:self.tableView];
    if (self.entity) {
        cell.height = [GAGoodsEvationCell goodsEvationHeight:self.entity];
        cell.entity = self.entity;
        [cell loadCell];
    }
    cell.delegate = self;
    return cell;
}

- (UITableViewCell*)tableViewSectionCommentCell:(NSIndexPath*)indexPath{
    CommentShopCell  *cell = [CommentShopCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"CommentShopCell"];
    CommentEntity *entity = self.dataList[indexPath.row];
    cell.entity = entity;
    return cell;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell  * cell;
    NSInteger section = indexPath.section;
    if (section == 0) {
        cell = [self tableViewSectionStartCell];
    }else{
        cell = [self tableViewSectionCommentCell:indexPath];
    }
    return cell;
}

- (void)clickGoodsEvationCellImgFrame:(CGRect)frame imgsURL:(NSArray*)imgsURL index:(NSInteger)index{
    
}


- (void)clickShopView:(GAGoodsEvaEntity*)entity{
    
}

- (void)userAttentionClick:(UserAttention*)atten clickTag:(UserCollectType)clickTag{
    switch (clickTag) {
        case UserCollectType_Shop:
            [XBUITool asRequestNetWork:^{
                [XBUITool showRmindView:@"点赞成功"];
            }];
            break;
        case UserCollectType_Store:
        {
            SubmitCommentVC *subVC = [[SubmitCommentVC alloc]init];
            [self.navigationController pushViewController:subVC animated:YES];
        }
            break;
        case UserCollectType_Stylist:
        {
            UIImage *image = [UIImage imageNamed:@"Icon"];
            if ([TSShareHelper shareWithType:TSShareHelperShareTypeWeChat andController:self andItems:@[image]]) {
                [XBUITool showRmindView:@""];
            }
        }
            break;
            
        default:
            break;
    }
}







-(NSArray *)randomArray
{
    //随机数从这里边产生
    NSMutableArray *startArray= [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopComment.json" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dict in array) {
        CommentEntity *entity = [CommentEntity commentEntityWithDict:dict];
        [startArray addObject:entity];
    }
    //随机数产生结果
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    //随机数个数
    NSInteger m = startArray.count;
    for (int i = 0; i< m; i++) {
        int t = arc4random()%startArray.count;
        resultArray[i]=startArray[t];
        startArray[t]=[startArray lastObject]; //为更好的乱序，故交换下位置
        [startArray removeLastObject];
    }
    return resultArray;
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
