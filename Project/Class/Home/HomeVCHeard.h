//
//  HomeVCHeard.h
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#ifndef HomeVCHeard_h
#define HomeVCHeard_h

#import "HomeDataModel.h"

#import "BaseWebViewController.h"
#import "BaseDataViewController.h"
#import "DisContentController.h"
#import "LotteryNoticeVC.h"
#import "GameViewController.h"
#import "XBNavigationController.h"
#import "OneBuyViewController.h"
#import "DisViewController.h"


#import "HomeTopPhotoCell.h"
#import "HomeListSectionCell.h"
#import "HomeSectionTitleCell.h"
#import "HomeSectionListCell.h"
#import "XBRunCircleTextCell.h"

enum{
    HomeSeciton_ScrollPicture = 0, //轮播图
    HomeSection_Circle,//跑马灯
    HomeSeciton_SectionBanner, 
    HomeSection_DataBase, // 资料库
    HomeSeciton_List,
    HomeSeciton_Banner,
    HomeSection_ListNews, //体育新闻
    HomeSecitont_Seivice,
    
    HomeSeciton_Invalid
};


#endif /* HomeVCHeard_h */
