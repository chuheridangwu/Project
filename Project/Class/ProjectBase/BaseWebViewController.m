//
//  BaseWebViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,assign)CGFloat offsetY; //偏移量

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
}

- (void)setWebUrl:(NSString *)webUrl{
    _webUrl = webUrl;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    //隐藏标题栏
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('header')[0].style.display='none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('header').style.display='none'"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    //隐藏标题栏
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('header')[0].style.display='none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('header').style.display='none'"];
}

#pragma mark - scrollView的代理方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _offsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > _offsetY) {
        //        [self hideNavgationBar];
        [self hideTabBar];
    }else{
        [self showTabBar];
        //        [self showNavgationBar];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentSize.height - scrollView.contentOffset.y  <=  SCREEN_HEIGHT) {
        [self showTabBar];
    }
}


// 显示tabbar
- (void)showTabBar
{
    [UIView animateWithDuration:0.6 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    }];
}


// 隐藏tabbar
- (void)hideTabBar {
    [UIView animateWithDuration:0.6 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
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
