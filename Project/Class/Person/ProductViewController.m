//
//  ProductViewController.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductView.h"
#import "RechargeHistoryViewController.h"

#import "FuqianlaPay.h"
#import <CommonCrypto/CommonDigest.h>

@interface ProductViewController ()<ProductViewDelegate>
{
    NSArray *_priceArray;
    NSArray *_saleArray;
    ProductView *_prodectView;
}

@property (nonatomic,strong)NSString *money;

@property(nonatomic, assign) BOOL signInApp;

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBColor(240, 240, 240);
    self.title = @"充值";
    
    self.signInApp = YES;

    
    _priceArray = @[@"50",@"100",@"150",@"300",@"500"];
    _saleArray = @[@"48",@"95",@"130",@"260",@"420"];
    
    _prodectView = [[ProductView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 145)];
    [self.view addSubview:_prodectView];
    _prodectView.delegate = self;
    [_prodectView setPrict:_priceArray withSaleArray:_saleArray];

    
    CGFloat yOffset = 220;
    CGFloat btnHeight = 40;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(10, yOffset, SCREEN_WIDTH-2*10, btnHeight);
    [submitBtn setBackgroundColor:XBAPPBaseColor];
    [submitBtn setBorderRadian:6.0 width:0.1 color:XBAPPBaseColor];
    [submitBtn setTitle:@"确认充值" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [submitBtn addTarget:self action:@selector(payMoney) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"充值记录" style:UIBarButtonItemStyleDone target:self action:@selector(clickRight)];
}

- (void)clickRight{
    RechargeHistoryViewController *vc = [[RechargeHistoryViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBtnCartInfoWithIndex:(NSInteger)tag{
    self.money = _saleArray[tag];
}

- (void)payMoney{
    
    [self configSDKSignParams];
    
    FuqianlaPay *manager = [FuqianlaPay sharedPayManager];
    manager.signType = @"md5";
    manager.showPayStatusView = YES;
    
    manager.transactionParams =
    @{
      @"app_id":@"appdcd3fafe632346a8beabed17356d1ce8",
      @"order_no":[self formatOrderId],
      //@"pmtTp":@"22",//打开则使用app的支付通道选择界面
      @"amount":_money,
      @"subject":@"充值商品",
      @"body":@"时时彩充值商品",
      @"notify_url":@"http://10.100.140.124:8081/adapter-client/receive/notify.htm",
      };
    
    
    [manager startPayAction];
}


#pragma mark------私有函数----

//商户app自己（借助商户服务器）完成签名
-(NSString*)merchAppSign:(NSString*)sourceString
{
    FuqianlaPay *manager = [FuqianlaPay sharedPayManager];
    
    NSString *signStr = nil;
    
    if([manager.signType isEqualToString:@"md5"])
    {
        NSMutableString *mstr = [sourceString mutableCopy];
        [mstr appendFormat:@"&key=%@",@"8BB418FCA8A480BC3E00365AE14148A2"];
        
        const char* str = [mstr UTF8String];
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(str,  (CC_LONG)strlen(str), result);
        NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
        
        for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
            [ret appendFormat:@"%02x",result[i]];
        }
        
        signStr = ret;
    }
    return signStr;
}


//配置签名信息
-(void)configSDKSignParams
{
    FuqianlaPay *manager = [FuqianlaPay sharedPayManager];
    
    //#define SDK负责签名
    
    if(!self.signInApp)//SDK实现签名
    {
        //SDK负责签名
        if(/*使用md5签名*/0)
        {
            manager.signType = @"md5";
            manager.merchMd5Key = @"e10adc3949ba59abbe56e057f20f883e";
        }
        else if(/*使用rsa签名*/1)
        {
            manager.signType = @"rsa";
            manager.rsaKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key61" ofType:@"p12"];
            manager.rsaKeyPassword = @"111111";
        }
        else/*系统签名*/
        {
            
        }
    }
    else//app实现签名
    {
        //商户自己负责签名
        manager.dataSignInMerchApp = YES;
        if(/*使用md5签名*/0)
        {
            manager.signType = @"md5";
        }
        else
        {
            manager.signType = @"rsa";
        }
        
        __weak typeof(manager) wManager = manager;
        __weak typeof(self) wSelf = self;
        
        __block BOOL hasSigned = NO;
        
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:3];
        
        ;
        
        manager.dataSignResult = ^NSString*(NSString *sourceData){
            //如果签名过程是异步操作，使用runloop机制保证SDK调用的同步性；
            while (!hasSigned) {
                [[NSRunLoop currentRunLoop] runUntilDate:[NSDate distantPast]];
                if([[NSDate date] timeIntervalSinceDate:date] >0)
                {
                    hasSigned = YES;
                }
                if(hasSigned)
                {
                    return [wSelf merchAppSign:sourceData];
                }
            }
            
            //如果签名过程是同步操作，签名完成后直接返回
            return [wSelf merchAppSign:sourceData];
        };
    }
    
}

-(NSString*)formatOrderId
{
    int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    
    return resultStr;
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
