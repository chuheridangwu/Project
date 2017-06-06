//
//  XBRequestModel.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XBRequestModelDelegate;
@interface XBRequestModel : NSObject
@property (nonatomic,weak)id<XBRequestModelDelegate> delegate;
- (void)requestNetWorkURL:(NSString*)url;
@end

@protocol XBRequestModelDelegate <NSObject>
- (void)requestNetWorkSuccess:(id)outcome;
- (void)requestNetWorkFailure;
@end
