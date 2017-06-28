//
//  Store.m
//  SweetsSdk
//
//  Created by vast-z on 2017/6/23.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"

static const NSMutableDictionary* OcStore;
static const NSMutableDictionary* JsStore;

@implementation Store

+ (void) initStore {
    NSLog(@"ExtentionStore Loaded");
    if(!OcStore) {
        OcStore = [[NSMutableDictionary alloc] init];
    }
    if(!JsStore) {
        JsStore = [[NSMutableDictionary alloc] init];
    }
}

+ (void) OcStoreSetDic: (NSDictionary*) dic {
    [OcStore addEntriesFromDictionary:dic];
}

+ (void) JsStoreSetDic: (NSDictionary*) dic {
    [JsStore addEntriesFromDictionary:dic];
}

+ (NSString*) OcStoreGetValByKey: (NSString*) key {
    return [OcStore objectForKey:key];
}

+ (void) OcStoreSet: (NSString*) key val:(NSString*) val {
    [OcStore setValue:val forKey:key];
}

+ (NSString*) JsStoreGetValByKey: (NSString*) key {
    return [JsStore objectForKey:key];
}

+ (void) JsStoreSet: (NSString*) key val: (NSString*) val {
    [JsStore setValue:val forKey:key];
}

@end
