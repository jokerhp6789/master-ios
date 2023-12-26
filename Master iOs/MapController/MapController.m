//
//  UIViewController+MapController.m
//  Master iOs
//
//  Created by admin on 21/12/2566 BE.
//

#import "MapController.h"
#import "LocationController.h"
#import "Location.h"
#import "MapItemViewCell.h"
#import "LocationView.h"

@implementation MapController

-(void)viewDidLoad {
	[super viewDidLoad ];
    
    MapContextManager *mapContextManager = [MapContextManager sharedInstance];
    mapContextManager.delegate = self;
    
	LocationController *model =[[LocationController alloc] init];
	self.points = [model getPointsOfInterest];
	
    UITableView *tableView = [[UITableView alloc]init ];
    
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.dataSource = self;
    
    [tableView registerClass:[MapItemViewCell class] forCellReuseIdentifier:MapItemView_CellId];
    
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(onPressMapItemButtonHandler:) name:@"onPressMapItemButton" object:nil];
    
    self.tableView = tableView;
    

}

-(void)viewWillAppear:(BOOL)animated {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return  self.points.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	MapItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MapItemView_CellId
                             forIndexPath:indexPath
    ];
    
    Location *point = [_points objectAtIndex:indexPath.row];
    
//	if(cell == nil){
//		cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//	}
//
//	cell.textLabel.text = [point valueForKey:@"address"];
//	[
//		cell.imageView setImage:[UIImage imageNamed:[point valueForKey:@"photo"]]
//	];
//	UIButton *button = [ [UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//	button.titleLabel.text = @"Go to map";
//	button.backgroundColor = [UIColor systemBlueColor];
//	button.tintColor = [UIColor whiteColor];
    
    [cell configure:point];

	return cell;
}


// implement UI using ScrollView
-(void)viewDidAppear:(BOOL)animated {
	LocationController *model =[[LocationController alloc] init];
	NSArray *points = [model getPointsOfInterest];
	for (Location *point in points) {
		UIView *pointItemView = [self renderItemView:point];
		[self.scrollView addSubview:pointItemView];
	}
}

-(UIView*)renderItemView:(Location *)point {
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, 75)];
	view.backgroundColor = [UIColor redColor];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
	label.text = point.address;
	[view addSubview:label];
	return  view;
}

- (void)onPressMapItemButton:(UIButton *)sender {
    NSArray *filter = [_points filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"id == %f",[sender.accessibilityLabel floatValue]]];
    
    if(filter.count > 0){
        Location *found = filter.firstObject;
        if(found != nil){
            LocationView *locationView = [[LocationView alloc]init ];
            locationView.activePoint = found;
            [self.navigationController pushViewController:locationView animated:YES];
        }
    }
        
}

- (void)onPressGoToMap:(UIButton *)sender {
    NSLog(@"onPressGoToMap In Map Controller View");
    NSArray *filter = [_points filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"id == %f",[sender.accessibilityLabel floatValue]]];
    
    if(filter.count > 0){
        Location *found = filter.firstObject;
        if(found != nil){
            LocationView *locationView = [[LocationView alloc]init ];
            locationView.activePoint = found;
            [self.navigationController pushViewController:locationView animated:YES];
        }
    }
    
}


- (void)onPressMapItemButtonHandler:(NSNotification *)payload {
   
    NSDictionary *userInfo = payload.userInfo;
    UIButton *button = userInfo[@"button"];
    NSLog(@"onPressMapItemButtonHandler In Map Controller View");
    
    NSArray *filter = [_points filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"id == %f",[button.accessibilityLabel floatValue]]];

    if(filter.count > 0){
        Location *found = filter.firstObject;
        if(found != nil){
            LocationView *locationView = [[LocationView alloc]init ];
            locationView.activePoint = found;
            [self.navigationController pushViewController:locationView animated:YES];
        }
    }
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
