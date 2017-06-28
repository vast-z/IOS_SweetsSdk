//
//  Store.h
//  SweetsSdk
//
//  Created by vast-z on 2017/6/23.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#ifndef Store_h
#define Store_h

@interface Store : NSObject

+ (void) initStore;
+ (NSString*) OcStoreGetValByKey: (NSString*) key;
+ (NSString*) JsStoreGetValByKey: (NSString*) key;
+ (void) OcStoreSet: (NSString*) key val:(NSString*) val;
+ (void) JsStoreSet: (NSString*) key val: (NSString*) val;
+ (void) OcStoreSetDic: (NSDictionary*) dic;
+ (void) JsStoreSetDic: (NSDictionary*) dic;

@end

#endif /* Store_h */
