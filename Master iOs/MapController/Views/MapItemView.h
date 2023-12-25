//
//  MapContentView.h
//  Master iOs
//
//  Created by Trung DX on 25/12/2566 BE.
//

#ifndef MapContentView_h
#define MapContentView_h


#endif /* MapContentView_h */

#import <UIKit/UIKit.h>
#import "Location.h"

typedef void (^CallbackBlock)(void);

@protocol MapItemViewDelegate <NSObject>

-(void) onPressMapItemButton:(UIButton*)sender;

@end


@interface MapItemView : UIView

@property (strong,nonatomic) Location *location;

@property (weak,nonatomic) id<MapItemViewDelegate> delegate;

- (UIView*) configure:(Location*) location;

@end
