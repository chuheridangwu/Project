//
//  UserSettingController.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "UserSettingController.h"
#import "UserSettingImageCell.h"
#import "UserSettingInfoCell.h"
#import "NameViewController.h"



static NSString * indentifier1 = @"UserSettingImageCell";


@interface UserSettingController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *nameArray;

@property (nonatomic, strong)UIImagePickerController * picker;
@property (nonatomic, strong)UIImage *saveImage;

@end

@implementation UserSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate  =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.tableFooterView = [self tableForFootView];
    self.titleArray = @[@"昵称",@"ID号",@"手机号"];
    self.nameArray = @[@"一直大花猫",@"1102233",@"136****6666"];
}

- (void)registerCells{
    [_tableView registerNib:[UINib nibWithNibName:indentifier1 bundle:nil] forCellReuseIdentifier:indentifier1];
//    [_tableView registerNib:[UINib nibWithNibName:@"CallTableViewCell" bundle:nil] forCellReuseIdentifier:indentifier5];
  
}

-(UIView*)tableForFootView{
    UIView *footView = [[UIView alloc] init];
    
    CGFloat yOffset = 40;
    CGFloat btnHeight = 40;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(30, yOffset, SCREEN_WIDTH-2*30, btnHeight);
    [submitBtn setBackgroundColor:XBAPPBaseColor];
    [submitBtn setBorderRadian:6.0 width:0.1 color:XBAPPBaseColor];
    [submitBtn setTitle:@"保存信息" forState:UIControlStateNormal];
    [submitBtn setTitle:@"保存信息" forState:UIControlStateSelected];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:submitBtn];
    
    yOffset += btnHeight;
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, yOffset);
    [footView setFrame:rect];
    return footView;
}

- (void)submit{
    [XBUITool asRequestNetWork:^{
        [XBUITool showRmindView:@"保存成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger row = 0;
    if (section == 0) {
        row = 1;
    }else{
        row = self.titleArray.count;
    }
    return row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    CGFloat height = 44;
    if (section == 0) {
        height = UserSettingImageCellHeight;
    }
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}


- (UITableViewCell*)tableViewSectionUserImageCell{
    UserSettingImageCell *cell = [UserSettingImageCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"UserSettingImageCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (UITableViewCell*)tableViewCell:(NSIndexPath*)indexPath{
    UserSettingInfoCell*cell = [UserSettingInfoCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"UserSettingInfoCell"];
    [cell setNameText:self.titleArray[indexPath.row] titleText:self.nameArray[indexPath.row]];
    if (indexPath.row == 0) {
        [cell setisOpen:YES];
    }
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    UITableViewCell *cell;
    if (section == 0) {
        cell = [self tableViewSectionUserImageCell];

    }else {
        cell = [self tableViewCell:indexPath];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    if (section == 0) {
        [self iconImageViewTaped];
    }else{
        if (indexPath.row == 0) {
            NameViewController *namevc = [[NameViewController alloc]init];
            [self.navigationController pushViewController:namevc animated:YES];
        }
    }
}



/**
 * 轻拍头像,换头像
 */
- (void)iconImageViewTaped{
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"选择图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    sheet.delegate =self;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂不支持拍照,是否调用相册?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    if (buttonIndex == 0) {//相机
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self pickerToPictureLibrary:YES];
        }else{
            [alertView show];
        }
    }else if (buttonIndex == 1){//相册
        [self pickerToPictureLibrary:NO];
    }
}

- (void)pickerToPictureLibrary:(BOOL)isCamera{
    self.picker = [[UIImagePickerController alloc] init];
    _picker.delegate = self;
    if (isCamera) {
        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    _picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:self.picker animated:YES completion:nil];
}

#pragma mark -- UIImmagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //上传图片。成功后得到返回的url
    //修改头像
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    NSString * url = @"http://120.27.199.125:8079/manmao-admin/upload_image";
    NSString *url = @"http://114.215.166.121/per/upload_image";
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript", nil];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //设置请求头
    [manager.requestSerializer setValue:@"Keep-Alive" forHTTPHeaderField:@"Connection"];
    [manager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"Charset"];
    [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-type"];
    
    [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage * obj = [[UIImage alloc] init];
        self.saveImage = [obj imageWithImageSimple:image scaledToSize:CGSizeMake(60, 60)];
        
        NSData * imageData=UIImageJPEGRepresentation(image, 0.8);
        NSString * fileName=[NSString stringWithFormat:@"img%@.jpg",@"suibian"];
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpg/file"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSString * urlString = [responseObject firstObject];
        NSString * netPath = @"api/user_headImage";
        NSMutableDictionary * allParams =[NSMutableDictionary dictionary];
        [allParams setObject:urlString forKey:@"head_url"];//上传图片是另外一个接口，上传成功了会返回url给你，然后你再调用这个接口更新用户头像
        [XBRequestNetTool post:netPath params:allParams success:^(id responseObj) {
            if ([responseObj[@"statu"] integerValue] == 200) {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [XBUITool showRmindView:@"修改成功"];
            }else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [XBUITool showRmindView:@"修改成功"];
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [XBUITool showRmindView:@"修改成功"];
    }];
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
