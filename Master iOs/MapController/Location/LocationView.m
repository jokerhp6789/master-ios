//
//  LocationView.m
//  Master iOs
//
//  Created by admin on 22/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "LocationView.h"
#import "Location.h"
#import "LocationController.h"

@implementation LocationView


- (void)viewDidLoad{
	[super viewDidLoad];
	MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) ];
	[self.view addSubview:mapView];
}


@end