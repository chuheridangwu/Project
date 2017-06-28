//
//  HomeDataModel.h
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataModel : NSObject
@property (nonatomic,strong)NSArray *listArray; //双色球

@property (nonatomic,strong)NSArray *newsArray; //体育新闻

@property (nonatomic,strong)NSArray *dataBaseArray; //资料库

@property (nonatomic,strong)NSDictionary *gameNews; //今日竞彩


@property (nonatomic,strong)NSArray *luckArray; //购彩的数组


@end
