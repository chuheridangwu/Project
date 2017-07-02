//
//  StoreViewController.m
//  Project
//
//  Created by dym on 2017/6/26.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreInfoViewController.h"
#import "XBNavigationController.h"
#import "MoreViewController.h"

#import "HomeDataModel.h"

#import "StoreEntity.h"
#import "StoreTableViewCell.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#define ISPOSITIONING  @"ISPOSITIONING"


@interface StoreViewController ()<StoreTableViewCellDelegate,CLLocationManagerDelegate,UIAlertViewDelegate>
@property (nonatomic,strong)CLLocationManager *manger;
@property (nonatomic,strong)NSArray *maps;
@property (nonatomic,assign)CLLocationCoordinate2D destinationCoordinate2D;
@property (nonatomic,strong)UIAlertController *alert;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)UIViewController *disMissVC;

@end

@implementation StoreViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.index = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.requestUrl = @"http://mapi.yjcp.com/api/gain/tenawardinfo?lotId=33&pageNum=1&sid=31000000000";
    self.tableView.rowHeight = StoreTableViewCellHeight;
    
    self.index = 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StoreTableViewCell *cell = [StoreTableViewCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"StoreTableViewCell"];
    StoreEntity *entity = self.dataList[indexPath.row];
    [cell setEntity:entity];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    HomeDataModel *model = [[HomeDataModel alloc]init];
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    moreVC.array = model.luckArray;
    XBNavigationController *navVC = [[XBNavigationController alloc]initWithRootViewController:moreVC];

    [self presentViewController:navVC animated:YES completion:nil];
    moreVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消"  style:UIBarButtonItemStylePlain target:self action:@selector(clickCloseVC)];
    self.disMissVC = moreVC;
}

- (void)clickCloseVC{
    [self.disMissVC dismissViewControllerAnimated:YES completion:nil];
}



- (void)getLocation{
    
    //请开启定位服务
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status)
    {
        //读取本地数据
        NSString * isPositioning = [[NSUserDefaults standardUserDefaults] valueForKey:ISPOSITIONING];
        if (isPositioning == nil)//提示
        {
            UIAlertView * positioningAlertivew = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"为了更好的体验,请到设置->隐私->定位服务中开启定位服务!已便获取附近信息!" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"永不提示",@"残忍拒绝",nil];
            positioningAlertivew.tag = 30;
            [positioningAlertivew show];
        }
    }else{
        //需要删除本地字符
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:ISPOSITIONING];
        [userDefaults synchronize];
    }
    
    //在ios 8.0上要授权
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        //使用应用程序期间允许访问位置数据
        [self.manger requestWhenInUseAuthorization];
        //始终允许访问位置信息
        [self.manger requestAlwaysAuthorization];
    }
    
    //开始定位
    [self.manger startUpdatingLocation];
}


- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StoreList.json" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        StoreEntity *entity = [StoreEntity storeWithEntity:dict];
        [dataArray addObject:entity];
    }
    self.dataList = dataArray;
    [self.tableView reloadData];
}


//只要定位到用户位置，就会调用，调用频率高
//CLLocation。coordinate经纬度

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:( NSArray<CLLocation *> *)locations{
    //取出位置对象
    CLLocation *cll = [locations firstObject ];
    
    //取出坐标
    CLLocationCoordinate2D  coord = cll.coordinate ;
    
    self.maps = [self getInstalledMapAppWithEndLocation:coord];
    //停止定位
    
    [self.manger stopUpdatingLocation ];
    
//    self.index ++;
//    if (self.index > 1) {
//        return;
//    }
    
    self.alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"打开去店铺的路线" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *cancel1 =  [UIAlertAction actionWithTitle:@"苹果地图" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self navAppleMap];
    }];
    
    [self.alert addAction:cancel];
    [self.alert addAction:cancel1];
    [self  presentViewController:self.alert animated:YES completion:nil];
}


//定位失败

-( void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    if ([error code]==kCLErrorDenied) {
        [XBUITool showRmindView:@"无法获取位置信息"];
        NSLog(@"访问被拒绝");
    }
    
    if ([error code]==kCLErrorLocationUnknown ) {
         NSLog(@"无法获取位置信息");
        [XBUITool showRmindView:@"无法获取位置信息"];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 30) {
        if (buttonIndex == 0)//确认跳转设置
        {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
        else if (buttonIndex == 1)//永不提示
        {
            //存入本地
            NSString * isPositioning = @"永不提示";
            NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:isPositioning forKey:ISPOSITIONING];
        }
        else//残忍拒绝
        {
            //取消不做提示
        }
    }else{
        if (buttonIndex == 0) {
            [self navAppleMap];
            return;
        }else if(buttonIndex == 2){
            return;
        }
        NSDictionary *dic = self.maps[buttonIndex];
        NSString *urlString = dic[@"url"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
}


-(void)actionSheet:(UIAlertView *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != -1) {
        if (buttonIndex == 0) {
            [self navAppleMap];
            return;
        }
        NSDictionary *dic = self.maps[buttonIndex];
        NSString *urlString = dic[@"url"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
}

//苹果地图
- (void)navAppleMap{
    
    //获取当前位置
    MKMapItem *mylocation = [MKMapItem mapItemForCurrentLocation];
    //目的地位置
    CLLocationCoordinate2D coords2;
    coords2.latitude= 120.17;
    coords2.longitude= 30.25;
    
    //当前的位置
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    
    //目的地的位置
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coords2 addressDictionary:nil]];
    
    
    
    toLocation.name = @"目的地";
    NSArray *items = [NSArray arrayWithObjects:currentLocation, toLocation, nil];
    
    NSDictionary *options = @{ MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey:@YES };
    
    //打开苹果自身地图应用，并呈现特定的item
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

#pragma mark - 导航方法
- (NSArray *)getInstalledMapAppWithEndLocation:(CLLocationCoordinate2D)endLocation
{
    NSMutableArray *maps = [NSMutableArray array];
    
    //苹果地图
    NSMutableDictionary *iosMapDic = [NSMutableDictionary dictionary];
    iosMapDic[@"title"] = @"苹果地图";
    [maps addObject:iosMapDic];
    
    //百度地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
        NSMutableDictionary *baiduMapDic = [NSMutableDictionary dictionary];
        baiduMapDic[@"title"] = @"百度地图";
        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=北京&mode=driving&coord_type=gcj02",endLocation.latitude,endLocation.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        baiduMapDic[@"url"] = urlString;
        [maps addObject:baiduMapDic];
    }
    
    
    return maps;
}



- (CLLocationManager*)manger{
    //开始定位
    if (![CLLocationManager locationServicesEnabled])  return nil;
    
    if (!_manger
        ) {
        
        _manger = [[CLLocationManager alloc]init];
        _manger.delegate = self;
    }
    
    return _manger;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
