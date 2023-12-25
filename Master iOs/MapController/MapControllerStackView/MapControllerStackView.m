//
//  MapControllerStackView.m
//  Master iOs
//
//  Created by admin on 22/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "MapControllerStackView.h"
#import "LocationController.h"
#import "Location.h"
#import "LocationView.h"
#import "MapItemView.h"


@implementation MapControllerStackView


- (void)viewDidLoad {
    [super viewDidLoad];
    
    LocationController *model =[[LocationController alloc] init];
    self.points = [model getPointsOfInterest];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    
    self.stackView = [[UIStackView alloc] init];
    self.stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    self.stackView.backgroundColor = [UIColor whiteColor];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.spacing = 0;
    
    [self.scrollView addSubview:_stackView];
    [self.view addSubview: self.scrollView];
    
    NSMutableArray<NSLayoutConstraint*> *scrollViewContraint = [[NSMutableArray alloc] init];
    
    [scrollViewContraint addObject:[self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0]];
    [scrollViewContraint addObject:[self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]];
    [scrollViewContraint addObject:[self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0]];
    [scrollViewContraint addObject:[self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0]];
    
    [NSLayoutConstraint activateConstraints:scrollViewContraint];
    
    NSMutableArray<NSLayoutConstraint*> *stackViewContraint = [[NSMutableArray alloc] init];
    
    [stackViewContraint addObject:[self.stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:50]]; // add padding 50 from top of scroll view
    [stackViewContraint addObject:[self.stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor]];
    [stackViewContraint addObject:[self.stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor]];
    [stackViewContraint addObject:[self.stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-200]]; // add padding 200 from bottom of scroll view
    [stackViewContraint addObject:[self.stackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor constant:0]]; // if not setting width contrant , the items inside stackview will not have specific width and its style like background color can not be set
    
    [NSLayoutConstraint activateConstraints:stackViewContraint];
    
    if(self.points != nil){
        for (Location *point in self.points) {
            MapItemView *mapItemView = [[MapItemView alloc]init ];
            mapItemView.delegate = self;
            UIView *pointItemView = [mapItemView configure:point];
            [self.stackView addArrangedSubview:pointItemView];
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    // if putting the render UI logic here will cause a bugs of rerender the item when perform the half-way pull to go back on the screen
    
    //	LocationController *model =[[LocationController alloc] init];
    //	self.points = [model getPointsOfInterest];
    //
    //	if(self.points != nil){
    //		for (Location *point in self.points) {
    //			UIView *pointItemView = [self renderItemView:point];
    //			[self.stackView addArrangedSubview:pointItemView];
    //		}
    //	}
}

-(IBAction)onPressMapItemButton:(UIButton*)sender {
    NSLog(@"Button value: %@",sender.accessibilityLabel);
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



@end
