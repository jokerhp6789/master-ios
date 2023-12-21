//
//  MapControllerStackView.m
//  Master iOs
//
//  Created by Trung DX on 21/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "MapControllerStackView.h"
#import "LocationController.h"
#import "Location.h"

@implementation MapControllerStackView


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.showsVerticalScrollIndicator = YES;
    
    self.stackView= [[UIStackView alloc] initWithFrame:self.view.bounds];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.spacing = 0;
    [_scrollView addSubview:_stackView];
    [self.view addSubview:_scrollView ];
    
}

// implement UI using ScrollView
-(void)viewDidAppear:(BOOL)animated {
    LocationController *model =[[LocationController alloc] init];
    NSArray *points = [model getPointsOfInterest];
    for (Location *point in points) {
        UIView *pointItemView = [self renderItemView:point];
        [self.stackView addArrangedSubview:pointItemView];
    }
}

-(UIView*)renderItemView:(Location *)point {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.bounds.size.width, 50)];
    view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    label.text = point.address;
    [view addSubview:label];
    return  view;
}


@end
