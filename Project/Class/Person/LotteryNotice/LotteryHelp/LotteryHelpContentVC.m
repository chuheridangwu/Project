//
//  LotteryHelpContentVC.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "LotteryHelpContentVC.h"

@interface LotteryHelpContentVC ()<UIWebViewDelegate>

@end

@implementation LotteryHelpContentVC

- (void)loadView
{
    // 自定义控制器的view
    self.view = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 取出webView加载网页
    UIWebView *webView = (UIWebView *)self.view;
    
    //    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.html" ofType:nil];
    //    // 如果路径中有中文，必须转换下百分号,通常用UTF8转中文
    //   filePath = [filePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //
    //    NSURL *url = [NSURL URLWithString:filePath];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:_htmlItem.html withExtension:nil];
    
    // 如果文件路径中有中文，转换成URL会失败，
    
    //    NSLog(@"%@--%@",filePath,url);
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;
}
// webView加载完成的时候调用
// 执行javascript,必须要在webView加载完成时候执行
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString *javaStr = [NSString stringWithFormat:@"window.location.href = '#%@';",_htmlItem.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:javaStr];
}
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
