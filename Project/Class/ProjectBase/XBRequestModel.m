//
//  XBRequestModel.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBRequestModel.h"
#import "XBRequestNetTool.h"

@implementation XBRequestModel

- (void)requestNetWorkURL:(NSString *)url{

    [XBRequestNetTool post:url params:nil success:^(id responseObj) {
        
        if ([self.delegate respondsToSelector:@selector(requestNetWorkSuccess:)]) {
            [self.delegate requestNetWorkSuccess:responseObj];
        }
        
    } failure:^(NSError *error) {
        
    }];
}


@end
