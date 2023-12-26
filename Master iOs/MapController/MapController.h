//
//  UIViewController+MapController.h
//  Master iOs
//
//  Created by admin on 21/12/2566 BE.
//

#import <UIKit/UIKit.h>
#import "MapItemView.h"
#import "MapContextManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapController:UITableViewController<UITableViewDelegate,UITableViewDataSource,MapItemViewDelegate,MapContextManagerDelegate>

@property (strong,nonatomic) NSArray *points;

@property (strong,nonatomic) UIScrollView *scrollView;


@end

NS_ASSUME_NONNULL_END
