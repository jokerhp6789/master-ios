//
//  ChantsVIewController.h
//  Master iOs
//
//  Created by Trung DX on 23/12/2566 BE.
//

#ifndef ChantsVIewController_h
#define ChantsVIewController_h


#endif /* ChantsVIewController_h */

#import <UIKit/UIKit.h>


@interface  ChantsVIewController: UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) NSArray *teams;

@end
