//
//  ExtentionStore.h
//  SweetsSdk
//
//  Created by vast-z on 2017/6/23.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#ifndef ExtentionStore_h
#define ExtentionStore_h

#import "CordovaManager.h"

@interface ExtentionStore : CDVPlugin
- (void) setStoreData:(CDVInvokedUrlCommand*)command;
- (void) getStoreData:(CDVInvokedUrlCommand*)command;
- (void) jsFunction:(CDVInvokedUrlCommand*)command;
- (void) exit:(CDVInvokedUrlCommand*)command;
- (void) hide:(CDVInvokedUrlCommand*)command;
@end

#endif /* ExtentionStore_h */
