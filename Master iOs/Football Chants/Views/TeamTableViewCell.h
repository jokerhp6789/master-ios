//
//  TeamTableViewCell.h
//  Master iOs
//
//  Created by Trung DX on 24/12/2566 BE.
//

#ifndef TeamTableViewCell_h
#define TeamTableViewCell_h


#endif /* TeamTableViewCell_h */

#import <UIKit/UIKit.h>
#import "Team.h"


extern  NSString *const cellId;

@interface TeamTableViewCell : UITableViewCell

@property (strong,nonatomic) Team *teamData;

-(void)configure:(Team*) team;
@end
