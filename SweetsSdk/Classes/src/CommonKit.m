//
//  CommonKit.m
//  SweetsSdk
//
//  Created by Vast on 2017/6/23.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonKit.h"

@implementation CommonKit

/**
 用于判断字符串是否为空
 
 @param string 待检测字符串
 @return 检测结果
 */
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

@end
