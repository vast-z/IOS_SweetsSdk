//
//  ExtentionStore.m
//  SweetsSdk
//
//  Created by vast-z on 2017/6/23.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExtentionStore.h"
#import "Store.h"

@implementation ExtentionStore

- (id) init {
    if(self = [super init]){
    }
    return self;
}
/*----------------------Js调用接口接口----------------------------*/
- (void) setStoreData:(CDVInvokedUrlCommand*)command {
    //[Store JsStoreSet:@"msg" val:[command.arguments objectAtIndex:0]];
    NSString* val = [command.arguments objectAtIndex:0];
    NSString* callbackId = command.callbackId;
    NSError* err;
    NSDictionary* msgDic = [NSJSONSerialization JSONObjectWithData:[val dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Params invalid"];
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
    [Store JsStoreSetDic:msgDic];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void) getStoreData:(CDVInvokedUrlCommand*)command {
    NSString* val = [Store OcStoreGetValByKey:[command.arguments objectAtIndex:0]];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: val];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void) jsFunction:(CDVInvokedUrlCommand*)command {
    [CordovaManager setHoldCDVInvokedUrlCommand:command];
}
- (void) exit:(CDVInvokedUrlCommand*)command {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
- (void) hide:(CDVInvokedUrlCommand*)command {
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
