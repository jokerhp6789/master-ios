//
//  MapContextManager.h
//  Master iOs
//
//  Created by Trung DX on 26/12/2566 BE.
//

#ifndef MapContextManager_h
#define MapContextManager_h


#endif /* MapContextManager_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MapContextManagerDelegate <NSObject>

-(void)onPressGoToMap:(UIButton *)sender;

@end

@interface MapContextManager : NSObject

@property (nonatomic,weak) id<MapContextManagerDelegate> delegate;

+ (instancetype) sharedInstance;

- (void)onPressGoToMapDispatcher:(UIButton *)sender;

@end
