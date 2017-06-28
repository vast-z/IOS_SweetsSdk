/********* Payment.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "SPayClient.h"

@interface PaymentPlugin : CDVPlugin {
  // Member variables go here.
}
- (void) doWithWft:(CDVInvokedUrlCommand*)command;
@end

@implementation PaymentPlugin

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 注册信息
    }
    return self;
}

/**
 通过威付通进行支付

 @param command 传入参数 example: {"token_id": "<token_id>", "services": <services>, "amount": <amount>}
 */
- (void) doWithWft:(CDVInvokedUrlCommand*)command
{
    // 提取订单json字符串
    NSString *callbackId = command.callbackId;
    NSString *orderStr = [command.arguments objectAtIndex:0];
    NSLog(@"%@ %@", @"Enter plugin:", orderStr);
    NSError* err;
    // json反序列化
    NSDictionary *orderInfo = [NSJSONSerialization
                               JSONObjectWithData:[orderStr dataUsingEncoding:NSUTF8StringEncoding]
                               options:NSJSONReadingMutableContainers
                               error:&err];
    // 转换错误返回参数不合法
    if(err) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                          messageAsString:@"Params invalid"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
        return;
    }
    // 提取相关参数
    NSString *tokenId = [orderInfo objectForKey:@"token_id"];
    NSString *service = [orderInfo objectForKey:@"service"];
    NSNumber *amount = [orderInfo objectForKey:@"amount"];
    // 完成后的回掉操作
    SPayPayFinishBlock finBlock = ^(SPayClientPayStateModel *payStateModel,
                                    SPayClientPaySuccessDetailModel *paySuccessDetailModel) {
        CDVPluginResult* pluginResult;
        // 判断支付状态
        if(payStateModel.payState == SPayClientConstEnumPaySuccess) {
            
            NSLog(@"pay success");
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                             messageAsString:paySuccessDetailModel.message];
            // 通知js
            [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
        }else {
            NSLog(@"pay fail");
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:paySuccessDetailModel.message];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
        }
    };
    // 执行操作
    [[SPayClient sharedInstance] pay: self.viewController
                              amount: amount
                   spayTokenIDString: tokenId
                   payServicesString: service
                              finish: finBlock];
}

@end