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
			UIView *pointItemView = [self renderItemView:point];
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

-(UIView*)renderItemView:(Location *)point {
	UIView *view = [[UIView alloc] init];
	view.backgroundColor = [UIColor whiteColor];
	view.layer.borderWidth = 0.5;
	view.layer.borderColor = [UIColor grayColor].CGColor;
	
	UIView *subView = [[UIStackView alloc] init];
	
	subView.backgroundColor = [UIColor darkGrayColor];
	subView.translatesAutoresizingMaskIntoConstraints = false;
	subView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
	subView.layer.cornerRadius = 16;
	
	[view addSubview:subView];
	
//	CGRect bounds = view.bounds;
//	bounds.size.width = bounds.size.width - 20;
//	[view setBounds:bounds];

//	CGRect newFrame = view.frame;
//	newFrame.size.height = 300;
//	[view setFrame:newFrame];
	
	UIStackView *infoView = [[UIStackView alloc] init];
	infoView.backgroundColor = [UIColor lightGrayColor];
	infoView.layer.cornerRadius = 8;
	infoView.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor;
	infoView.layer.borderWidth = 0.5;
	infoView.translatesAutoresizingMaskIntoConstraints = false; // => set this to constrain the view  to it suprer view by calling the activateConstraints methods in the bottom;
//	infoView.axis = UILayoutConstraintAxisVertical;
	infoView.alignment = UIStackViewAlignmentCenter;
	infoView.distribution = UIStackViewDistributionFill;

	[subView addSubview:infoView];
	
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 50)];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	button.translatesAutoresizingMaskIntoConstraints = false;
	
	[button addTarget:self action:@selector(onInformationPress:) forControlEvents:UIControlEventTouchUpInside];
	
	[infoView addArrangedSubview:label];
	[infoView addArrangedSubview:button];
	

	label.textAlignment = NSTextAlignmentCenter;
	label.numberOfLines = 0;
	label.lineBreakMode = NSLineBreakByWordWrapping;
	label.text = point.address;
	
	[NSLayoutConstraint activateConstraints:@[
	   [button.heightAnchor constraintEqualToConstant:44],
	   [button.widthAnchor constraintEqualToConstant:44],
	]];
	
	UIImageView *image = [[UIImageView alloc] init ];
	image.translatesAutoresizingMaskIntoConstraints = false;
	image.contentMode = UIViewContentModeScaleAspectFit;
	[image setImage:[UIImage imageNamed:point.photo]];
	[subView addSubview:image];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[view.heightAnchor constraintGreaterThanOrEqualToConstant:150], // set min-height for item container view;
		
		[subView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor constant:16.0],
		[subView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor constant:-16.0],
		[subView.topAnchor constraintEqualToAnchor:view.topAnchor constant:16.0],
		[subView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor constant:-16.0],
		
		[infoView.topAnchor constraintEqualToAnchor:subView.topAnchor constant:16],
		[infoView.leadingAnchor constraintEqualToAnchor:subView.leadingAnchor constant:16.0],
		[infoView.trailingAnchor constraintEqualToAnchor:subView.trailingAnchor constant:-16.0],
		[infoView.heightAnchor constraintEqualToConstant:75],
		
		[image.heightAnchor constraintEqualToConstant:125],
		[image.topAnchor constraintEqualToAnchor:infoView.bottomAnchor constant:16.0],
		[image.leadingAnchor constraintEqualToAnchor:subView.leadingAnchor constant:16.0],
		[image.trailingAnchor constraintEqualToAnchor:subView.trailingAnchor constant:-16.0],
		[image.bottomAnchor constraintEqualToAnchor:subView.bottomAnchor constant:-16.0],
	]];
	
	return  view;
}

-(IBAction)onInformationPress:(id)sender {
	NSLog(@"GO INTO INFORMATION");
	LocationView *locationView = [[LocationView alloc]init ];
	[self.navigationController pushViewController:locationView animated:YES];
}



@end
