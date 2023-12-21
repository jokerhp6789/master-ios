//
//  CalculationApp.m
//  Master iOs
//
//  Created by Trung DX on 18/10/2566 BE.
//

#import <Foundation/Foundation.h>
#import "CalculationApp.h"


inline float getResultFromOperation(int operation, float withResult,float andCurrentNumer,Boolean isEqualPress){
	switch (operation) {
		case 1:
			NSLog(@"You chose option 1");
			withResult = withResult + andCurrentNumer;
			break;
			
		case 2:
			NSLog(@"You chose option 2");
			withResult = withResult - andCurrentNumer;
			break;
			
		case 3:
			NSLog(@"You chose option 3");
			withResult = withResult * andCurrentNumer;
			break;
			
		case 4:
			NSLog(@"You chose option 4");
			withResult = withResult / andCurrentNumer;
			break;
		default:
			if(!isEqualPress){
			  withResult  = andCurrentNumer;
			}
			break;
	}
	return  withResult;
}

@implementation CalculationApp

-(void)viewDidLoad {
    self.label.text = @"0";
    currentNumber = 0;
    currentOperation = 0;
    result = 0;
}

- (IBAction)onDigitsPress:(id)sender{
    currentNumber = currentNumber *10 + (float)[sender tag];
    self.label.text = [NSString stringWithFormat:@"%6.0f", currentNumber];
}

- (IBAction)onCancelPress:(id)sender {
    currentNumber = 0;
    result = 0;
    self.label.text = @"0";
}

-(IBAction)onOperationPress:(id)sender {
     result = getResultFromOperation(currentOperation, result, currentNumber,false);
     currentOperation = (int)[sender tag];
     currentNumber = 0;
}

- (IBAction)onEqualPress:(id)sender {
	if(currentOperation != 0){
		result = getResultFromOperation(currentOperation,result,  currentNumber,true);
	}
	currentNumber = 0;
	currentOperation = 0;
	self.label.text = [NSString stringWithFormat:@"%6.0f", result];
	
}



@end
