//
//  XBRequestNetTool.h
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBRequestNetTool : NSObject

+ (instancetype)shareBaseHttpTool;

/**
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)uploadImageWithPath:(NSString *)netPath name:(NSString *)name imagePathList:(NSArray *)imageList params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)uploadImageWithPath:(NSString *)url indexName:(NSString *)name imagePathList:(NSArray *)imageList params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end
