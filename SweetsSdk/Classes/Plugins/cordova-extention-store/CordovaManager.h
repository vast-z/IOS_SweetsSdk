//
//  CordovaManager.h
//  SweetsSdk
//
//  Created by vast-z on 2017/6/27.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#ifndef CordovaManager_h
#define CordovaManager_h

#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface CordovaManager : NSObject
+ (void) setHoldCDVInvokedUrlCommand: (CDVInvokedUrlCommand*)command;
+ (void) sendMsgToCordova: (NSString*)msg CDVViewController:(CDVViewController*) cdvViewController;
@end


#endif /* CordovaManager_h */
