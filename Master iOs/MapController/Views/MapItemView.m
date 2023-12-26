//
//  MapContentView.m
//  Master iOs
//
//  Created by Trung DX on 25/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "MapItemView.h"
#import "Location.h"




@implementation MapItemView

- (instancetype)init{
    self = [super init];
    if(self){
       [MapContextManager sharedInstance].delegate = self;
    }
    return  self;
}

- (UIView*)configure:(Location *) location{
   
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    UIView *subView = [[UIStackView alloc] init];
    
    subView.backgroundColor = [UIColor darkGrayColor];
    subView.translatesAutoresizingMaskIntoConstraints = false;
    subView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    subView.layer.cornerRadius = 16;
    
    [self addSubview:subView];
    
//    CGRect bounds = view.bounds;
//    bounds.size.width = bounds.size.width - 20;
//    [view setBounds:bounds];

//    CGRect newFrame = view.frame;
//    newFrame.size.height = 300;
//    [view setFrame:newFrame];
    
    UIStackView *infoView = [[UIStackView alloc] init];
    infoView.backgroundColor = [UIColor lightGrayColor];
    infoView.layer.cornerRadius = 8;
    infoView.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor;
    infoView.layer.borderWidth = 0.5;
    infoView.translatesAutoresizingMaskIntoConstraints = false; // => set this to constrain the view  to it suprer view by calling the activateConstraints methods in the bottom;
//    infoView.axis = UILayoutConstraintAxisVertical;
    infoView.alignment = UIStackViewAlignmentCenter;
    infoView.distribution = UIStackViewDistributionFill;

    [subView addSubview:infoView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 50)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    button.translatesAutoresizingMaskIntoConstraints = false;
    button.accessibilityLabel = [location.id stringValue];

    [button addTarget:self action:@selector(onPressMapItemButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [infoView addArrangedSubview:label];
    [infoView addArrangedSubview:button];
    

    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = location.address;
    
    [NSLayoutConstraint activateConstraints:@[
       [button.heightAnchor constraintEqualToConstant:44],
       [button.widthAnchor constraintEqualToConstant:44],
    ]];
    
    UIImageView *image = [[UIImageView alloc] init ];
    image.translatesAutoresizingMaskIntoConstraints = false;
    image.contentMode = UIViewContentModeScaleAspectFit;
    [image setImage:[UIImage imageNamed:location.photo]];
    [subView addSubview:image];
    
    [NSLayoutConstraint activateConstraints:@[
        
        [self.heightAnchor constraintGreaterThanOrEqualToConstant:150], // set min-height for item container view;
        
        [subView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16.0],
        [subView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16.0],
        [subView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16.0],
        [subView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-16.0],
        
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
    
    return  self;
}
- (IBAction)onPressMapItemButton:(UIButton*)sender {
    if(self.delegate){
        [self.delegate onPressMapItemButton:sender];
    }
}

-(void)onPressGoToMap:(UIButton *)sender{
    NSLog(@"onPressGoToMap in Map Item View");
}

-(void)onPressButton:(UIButton*)sender {
    MapContextManager *mapContextManager = [MapContextManager sharedInstance];
    [mapContextManager onPressGoToMapDispatcher:sender];
//    [[MapContextManager new] onPressGoToMapDispatcher:sender];
}
@end
