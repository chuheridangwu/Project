//
//  DisViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DisViewController.h"
#import "DIscoverItem.h"
#import "DisContentController.h"

@interface DisViewController ()

@end

@implementation DisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.rowHeight = 80;
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Discover.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *iconArray = @[@"logo_任9场",@"logo_江西时时彩",@"logo_北京单场",@"logo_福彩3D",@"logo_江西时时彩",@"logo_江西时时彩",@"logo_广西快3",@"logo_贵州11选5",@"logo_贵州11选5",@"logo_贵州11选5",@"logo_快乐十分",@"logo_快乐十分",@"logo_快乐十分"];
    int  i = 0;
    for (NSDictionary *dict  in jsonDict[@"content"]) {
        DIscoverItem *item = [DIscoverItem disCoverItemWithDict:dict];
        item.iconName = iconArray[i];
        [self.dataList addObject:item];
        i++;
    }
    
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"wrwerew";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    DIscoverItem *item = self.dataList[indexPath.row];
    cell.textLabel.text = item.title;
    cell.imageView.image = [UIImage imageNamed:item.iconName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DIscoverItem *item = self.dataList[indexPath.row];
    DisContentController *contentVC = [[DisContentController alloc]init];
    contentVC.title = item.title;
    [self.navigationController pushViewController:contentVC animated:YES];
    contentVC.url = item.url;
}


- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
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
