//
//  MapContextManager.m
//  Master iOs
//
//  Created by Trung DX on 26/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "MapContextManager.h"

@implementation MapContextManager
static MapContextManager *singletonObject = nil;

- (instancetype)init{
//    static MapContextManager *mapContextManager = nil;
//    static dispatch_once_t onceToken;
//
//    dispatch_once(&onceToken, ^{
//        mapContextManager = [super init];
//    });
//
//    return  mapContextManager;
    if(!singletonObject){
        singletonObject = [super init];
    }
    return singletonObject;
}

+(instancetype)sharedInstance {
    
    if(!singletonObject){
        singletonObject = [[MapContextManager alloc] init];
    }
    return singletonObject;
    
//    static MapContextManager *mapContextManager = nil;
//    static dispatch_once_t onceToken;
//
//    dispatch_once(&onceToken, ^{
//        mapContextManager = [[self alloc]init ];
//    });
//    return mapContextManager;
}

- (void)onPressGoToMapDispatcher:(UIButton*)sender {
    if([self.delegate respondsToSelector:@selector(onPressGoToMap:)]){
        [self.delegate onPressGoToMap:sender];
    }
}

@end
