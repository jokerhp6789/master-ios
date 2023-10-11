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
	
	_MyMap.layer.cornerRadius = 8;
	_MyButton.backgroundColor = UIColor.blackColor;
	_MyButton.tintColor = UIColor.whiteColor;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
	
}

- (IBAction)myButtonPress:(id)sender {
	[MyLabel setText: [ViewController getRandomString:10]];
}
@end
