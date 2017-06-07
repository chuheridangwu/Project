//
//  GameViewController.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "GameViewController.h"
#import "BottonView.h"
#import "ContinueView.h"

@interface GameViewController ()<BottonViewDelegate>

@end

@implementation GameViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"小游戏";
    
    [self addCententView];
    
}



-(void)clickContentViewErrorMessage:(NSString*)time{
    [self clickNextViewImageName:@"pc_end_bad" time:time];
}

//成功
- (void)clickContentSuccessfulCustomsClearance:(NSString*)time{
    [self clickNextViewImageName:@"pc_end_good" time:time];
}



- (void)clickNextViewImageName:(NSString*)imageName time:(NSString*)time{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    ContinueView *contionView = [[ContinueView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:contionView];
    __weak typeof(self) blockSelf  = self;
    [contionView setContinueViewTime:time WithImgName:imageName NextBtn:^{
        [blockSelf addCententView];
    }];
}



- (void)addCententView{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    BottonView *cententView = [[BottonView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    cententView.delegate = self;
    [self.view addSubview:cententView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@" ---- 游戏界面消失");
}

@end
