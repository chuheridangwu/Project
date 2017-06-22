//
//  NSString+Helper.h
//  ARErp
//
//  Created by ZRAR on 14/11/6.
//  Copyright (c) 2014年 ZRAR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

- (NSString *)trimString;
- (BOOL)isEmptyString;
//遇到,号换行
+ (NSString*)replacementWithString:(NSString*)str;
//判断整个字符串是否为空格或者 nil,是的话为YES
+ (BOOL)isEmpty:(NSString *) str;
+ (NSMutableAttributedString*)changeFontAddColor:(NSString*)rootStr  sonStr:(NSString*)sonStr fontColor:(UIColor*)fontColor font:(UIFont*)font;

// 判断是否是手机号
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
- (NSString*)strwith;
+ (NSString*)urlRequestParamFrom:(NSDictionary*)dic;

- (NSString*)hiddenCharactersUserName:(NSString*)entit;
- (NSString*)hiddenCharacters:(NSString*)userName;
+ (NSArray *)jsonWithArray:(NSString*)jsonStr;

// 将URL中得参数转化成字典
+ (NSDictionary*)getURLParameter:(NSString*)urlString;

//判断网址链接中是否存在?号
- (NSString*)urlIsContainsSpecifiedString;

//将手机号中间四位数换成*
- (NSString *)hiddenPhonePartString;

//MD5加密字符串
+ (NSString*)stringMD5:(NSString*)input;

+(NSString *)dictionaryToJson:(NSDictionary *)dic;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
