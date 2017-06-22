//
//  NSString+Helper.m
//  ARErp
//
//  Created by ZRAR on 14/11/6.
//  Copyright (c) 2014年 ZRAR. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 是否空字符串
- (BOOL)isEmptyString
{
    return (self.length == 0);
}

//遇到,号换行
+ (NSString*)replacementWithString:(NSString*)str{
    if (str.length == 0) return nil;
    
    NSString *repStr = str;
    NSRange range = [str rangeOfString:@"，"];
    if (range.location != NSNotFound)
    {
        repStr  = [str stringByReplacingOccurrencesOfString:@"，"withString:@"\n"];
    }else{
        NSRange range1 = [str rangeOfString:@","];
        if (range1.location != NSNotFound)
        {
            repStr  = [str stringByReplacingOccurrencesOfString:@","withString:@"\n"];
        }else{
            return repStr;
        }
    }
    
    return repStr;
}



+ (BOOL)isEmpty:(NSString *) str {
    
    if (!str) {
        return YES;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

+ (NSMutableAttributedString*)changeFontAddColor:(NSString*)rootStr  sonStr:(NSString*)sonStr fontColor:(UIColor*)fontColor font:(UIFont*)font {
    //设置带属性的字体
    NSArray *array = [sonStr componentsSeparatedByString:@","];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:rootStr];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    dict[NSForegroundColorAttributeName] = fontColor;
    
    if (array.count != 0) {
        for (int i = 0 ; i < array.count; i++) {
            [atter addAttributes:dict range:[rootStr rangeOfString:array[i]]];
        }
    }else{
        [atter addAttributes:dict range:[rootStr rangeOfString:sonStr]];
    }
    
    return atter;
}

// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

- (NSString*)strwith{
    NSString *strUrl = [self stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return strUrl;
}

// 将字典转化成网络请求格式 &key=value&key=value
+ (NSString*)urlRequestParamFrom:(NSDictionary*)dic{
    NSArray *keys = [dic allKeys];
    if ([keys count] == 0){
        return nil;
    }
    
    NSMutableString *mutString = [NSMutableString string];
    for (NSString *key in keys){
        id value = [dic objectForKey:key];
        if (!value){
            NSLog(@"无效的参数 key = %@",key);
            continue;
        }
        if ([keys indexOfObject:key] != 0){
            [mutString appendString:@"&"];
        }
        [mutString appendFormat:@"%@=%@",key,value];
    }
    return mutString;
}

- (NSString*)hiddenCharacters:(NSString*)userName{
    if (userName.length >= 3){
        NSMutableString *str = [NSMutableString stringWithFormat:@"%@",userName];
        NSMutableString *str1 = [[NSMutableString alloc]init];
        for (int i = 0; i < str.length - 5; i++) {
            NSString *s = @"*";
            [str1 appendString:s];
            
        }
        [str deleteCharactersInRange:NSMakeRange(3, str.length - 5)];
        [str insertString:str1 atIndex:3];
        userName = str;
    }
    
    return userName;
}


- (NSString*)hiddenCharactersUserName:(NSString*)entity{
    NSString *userName = [NSString stringWithFormat:@"%@",entity];
    if (userName.length == 1) {
        userName = @"*";
    }else if (userName.length == 2){
        NSString *name = [userName stringByReplacingCharactersInRange:NSMakeRange(1, 1) withString:@"*"];
        userName = [NSString stringWithFormat:@"%@",name];
    }else if (userName.length >= 3){
        NSMutableString *str = [NSMutableString stringWithFormat:@"%@",userName];
        NSMutableString *str1 = [[NSMutableString alloc]init];
        for (int i = 0; i < str.length - 2; i++) {
            NSString *s = @"*";
            [str1 appendString:s];
            
        }
        [str deleteCharactersInRange:NSMakeRange(1, str.length - 1)];
        [str insertString:str1 atIndex:1];
        userName = str;
    }
    
    return userName;
}

+ (NSArray *)jsonWithArray:(NSString*)jsonStr{
    if ([jsonStr isEqualToString:@""] || [jsonStr isEqual:[NSNull class]] || jsonStr.length == 0 ) {
        return nil;
    }
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"%@",error);
        return nil;
    }
    return arr;
}


// 将URL中得参数转化成字典
+ (NSDictionary*)getURLParameter:(NSString*)urlString{
    if (urlString.length == 0) {
        return  nil;
    }
    NSMutableDictionary *dict =[NSMutableDictionary dictionary];
    NSArray *urlArray = [urlString componentsSeparatedByString:@"?"];
    
    if (urlArray.count > 1) {   //如果大于1，认为有参数
        NSString *URLParString = [urlArray lastObject];
        
        if ([URLParString rangeOfString:@"&"].location != NSNotFound) { //多个参数
            NSArray *dictArray = [URLParString componentsSeparatedByString:@"&"];
            for (NSString *KVString in dictArray) {
                NSArray *KVArray = [KVString componentsSeparatedByString:@"="];
                for (int i = 0; i < KVArray.count; i++) {
                    if (i == KVArray.count - 1) {
                        [dict setValue:KVArray[i] forKey:KVArray[i - 1]];
                    }
                }
            }
        }else if ([URLParString rangeOfString:@"="].location != NSNotFound){ //单个参数
            NSArray *dictArray = [URLParString componentsSeparatedByString:@"="];
            for (int i = 0; i < dictArray.count; i++) {
                if (i == dictArray.count - 1) {
                    [dict setValue:dictArray[i] forKey:dictArray[i - 1]];
                }
            }
        }
    }
    
    return dict;
}

- (NSString*)urlIsContainsSpecifiedString{
    NSString *URL = @"";
    if (self.length != 0) {
        
        if ([self rangeOfString:@"?"].location != NSNotFound) { //如果URL中包含?
            
            if ([self hasSuffix:@"?"] == NO) { // URL不以?号结尾
                URL = [NSString stringWithFormat:@"%@&",self];
            }else{
                URL  =self;
            }
            
        }else{ //URL中不包含?
            
            if ([self hasSuffix:@"?"] == NO) {
               URL = [NSString stringWithFormat:@"%@?",self];
            }
            
        }
        
    }
    return URL;
}

- (NSString*)hiddenPhonePartString{
 
    if([NSString isMobileNumber:self]){
     NSString *string = [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        return string;
    }
    return self;
}

//字典转为Json字符串

+(NSString *)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+ (NSString*)stringMD5:(NSString*)input{
    
    return  input;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


@end
