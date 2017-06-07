//
//  XBWebImgManager.h
//  ScrollPhoto
//
//  Created by dym on 16/12/16.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XBWebImgManager : NSObject
+ (instancetype)shareWebImgManager;

//下载失败重复下载次数,默认不重复,
@property (nonatomic,assign) NSUInteger DownloadImgRepeatCount;

//图片下载失败会调用该block(如果设置了重复下载次数,则会在重复下载完后,假如还没下载成功,就会调用该block)
//error错误信息
//url下载失败的imageurl
@property (nonatomic,copy) void(^downLoadImageError)(NSError *error,NSString *imageUrl);


//内存缓存
@property (nonatomic,strong) NSMutableDictionary *webImageCache;

//下载到的图片都会被保存到webImageCache和沙盒中,key为urlString
- (void)downloadImageWithUrlString:(NSString *)urlSting;

@end
