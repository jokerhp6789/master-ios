//
//  MapItemViewCell.m
//  Master iOs
//
//  Created by Trung DX on 25/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "MapItemViewCell.h"

NSString *const MapItemView_CellId = @"MapItemView_CellId";

@implementation MapItemViewCell

-(void)configure :(Location *)location  {
    
    UIView *containerView = [[UIView alloc] init];
    containerView.translatesAutoresizingMaskIntoConstraints = false;
    
    MapItemView *mapContentView = [[MapItemView alloc]init ];
    mapContentView.delegate = self;
    [mapContentView configure:location];
    mapContentView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.contentView addSubview:containerView];
    [containerView addSubview:mapContentView];
    
    
    [NSLayoutConstraint activateConstraints:@[
            [containerView.topAnchor  constraintEqualToAnchor:self.contentView.topAnchor],
            [containerView.bottomAnchor  constraintEqualToAnchor:self.contentView.bottomAnchor],
            [containerView.leadingAnchor  constraintEqualToAnchor:self.contentView.leadingAnchor],
            [containerView.trailingAnchor  constraintEqualToAnchor:self.contentView.trailingAnchor],
            
            [mapContentView.topAnchor constraintEqualToAnchor:containerView.topAnchor],
            [mapContentView.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor],
            [mapContentView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
            [mapContentView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
            
    ]];
}

- (void)onPressMapItemButton:(UIButton *)sender {
    NSLog(@"onPressMapItemButton");
}

@end
