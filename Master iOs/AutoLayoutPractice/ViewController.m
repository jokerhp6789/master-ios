//
//  ViewController.m
//  Master iOs
//
//  Created by admin on 9/10/2566 BE.
//2

#import "ViewController.h"

@interface ViewController ()

@end

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@implementation ViewController


+ (NSString *)getRandomString:(int)length{
	NSMutableString *randomString = [NSMutableString  stringWithCapacity:length];
	for(int i=0;i<length;i++){
		[randomString appendFormat:@"%C",[letters characterAtIndex:arc4random_uniform([letters length])]];
	}
	return  randomString;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_MyButton.layer.cornerRadius = 8;
	_MyButton.backgroundColor = UIColor.blackColor;
	_MyButton.tintColor = UIColor.whiteColor;
    _MyButton.backgroundColor = UIColor.blackColor;
    _MyButton.tintColor = UIColor.whiteColor;
	
	_MyMap.layer.cornerRadius = 8;
    
    
    CLLocationCoordinate2D centerCoordinate;
    centerCoordinate.latitude = 37.781453;
    centerCoordinate.longitude = -122.417158;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(centerCoordinate, 750, 750);
    [_MyMap setRegion:viewRegion animated:YES];
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
	NSLog(@"Get Into didReceiveMemoryWarning");
}

- (IBAction)myButtonPress:(id)sender {
	[self performSelector:@selector(didReceiveMemoryWarning) withObject:nil afterDelay:1.0];
	[MyLabel setText: [ViewController getRandomString:10]];
}
@end
