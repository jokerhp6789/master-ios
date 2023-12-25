//
//  MapItemViewCell.h
//  Master iOs
//
//  Created by Trung DX on 25/12/2566 BE.
//

#ifndef MapItemViewCell_h
#define MapItemViewCell_h


#endif /* MapItemViewCell_h */

#import <UIKit/UIKit.h>
#import "Location.h"
#import "MapItemView.h"

extern  NSString *const MapItemView_CellId;


@interface MapItemViewCell : UITableViewCell

@property (strong,nonatomic) Location *location;

-(void) configure:(Location*)location;

@end