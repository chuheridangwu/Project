//
//  FuqianlaPay.h
//  CEFastPayAggr
//
//  Created by zzf073 on 16/2/25.
//  Copyright © 2016年 zzf073. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CEPaymentStatus) {
    //支付成功
    kCEPayResultSuccess,
    //支付失败
    kCEPayResultFail,
    //支付处理中
    kCEPayResultProcessing,
    //支付取消
    kCEPayResultCancel,
    //参量错误
    kCEPayResultParamError,
    //其它错误
    kCEPayResultUnknow
};

//支付通道标示
 typedef NS_ENUM(NSInteger, CEPayType)
 {
     kPTApplePay = 28,
     kPTWeixinPay = 23,
     kPTAlipay = 22,
     kPTBaiduPay = 25,
     kPTYibaoPay = 32,
     kPTUPPay = 27,
     kPTJDPay = 26,
     kPTFenqi = 34,
     //下面通道为非支付通道
     kPTFenqiSp = 71,
 };


/*支付业务参量
 app_id	一秒支付分配给商户的应用id
 order_no	订单号
 //pmtTp	支付类型 apple pay定值 28
 amount	金额 元
 notify_url	通知地址
 subject	商品名称
 body	描述
 signInfo	签名信息
 */

@interface FuqianlaPay : NSObject

+ (FuqianlaPay*)sharedPayManager;

//支付通道类型
@property(nonatomic, readonly) CEPayType payType;

#pragma mark - 支付参量配置
//支付业务参量
@property(nonatomic, strong) NSDictionary *transactionParams;
//（选填）支付通道定制的额外交易参量，京东和易宝支付用到；
@property(nonatomic, copy) NSDictionary*(^payExtraParams)(CEPayType payType);

#pragma mark - 选填参量
//applepay 支付商户标示,暂时没用到
@property(nonatomic, strong) NSString *applePayMerchantId;
//是否是测试模式，银联测试时使用
@property(nonatomic, assign) BOOL inTestModel;
//是否显示付钱拉支付完成的状态页
@property(nonatomic, assign) BOOL showPayStatusView;

#pragma mark - 签名类参量(选填参量)
//签名类型:@"md5"、@"rsa"
@property(nonatomic, strong) NSString *signType;
//md5商户私钥
@property(nonatomic, strong) NSString *merchMd5Key;
//rsa商户私钥
@property(nonatomic, strong) NSString *rsaKeyPath;//.p12
@property(nonatomic, strong) NSString *rsaKeyPassword;

#pragma mark - 商户自己实现签名
//是否商户app自己实现签名，默认为否（SDK帮签）
@property(nonatomic, assign) BOOL dataSignInMerchApp;
//签名回调接口，SDK向app索要签名；sourceData为待签名字符串
@property(nonatomic, copy) NSString*(^dataSignResult)(NSString *sourceData);

#pragma mark - 启动支付
-(void)startPayAction;

#pragma mark - 支付回调相关
//支付完成后返回的支付token等参量，在payStatusCallBack中获取
@property(nonatomic, readonly) id callCackParams;
//支付完成回调函数，商户app用于监听支付状态
@property(nonatomic, copy) void(^payStatusCallBack)(CEPaymentStatus payStatus, NSString *tip);
//AppDelegate的application:openURL函数中使用
+(void)handlePayCallBackUrl:(NSURL *)url;

@end
