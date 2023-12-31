//
//  MapControllerStackView.h
//  Master iOs
//
//  Created by admin on 22/12/2566 BE.
//

#ifndef MapControllerStackView_h
#define MapControllerStackView_h


#endif /* MapControllerStackView_h */

#import <UIKit/UIKit.h>
#import "MapItemView.h"

@interface MapControllerStackView : UIViewController<MapItemViewDelegate>

@property (strong,nonatomic) UIScrollView *scrollView;

@property (strong,nonatomic) UIStackView *stackView;

@property (strong,nonatomic) NSArray *points;

@end
