//
//  CalculationApp.m
//  Master iOs
//
//  Created by Trung DX on 18/10/2566 BE.
//

#import <Foundation/Foundation.h>
#import "CalculationApp.h"


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
   
    switch (currentOperation) {
        case 1:
            NSLog(@"You chose option 1");
            result = result + currentNumber;
            break;
            
        case 2:
            NSLog(@"You chose option 2");
            result = result - currentNumber;
            break;
            
        case 3:
            NSLog(@"You chose option 3");
            result = result * currentNumber;
            break;
            
        case 4:
            NSLog(@"You chose option 4");
            result = result / currentNumber;
            break;

        default:
            NSLog(@"Invalid choice");
            result = currentNumber;
            break;
    }
    
    currentOperation = (int)[sender tag];
    
    switch (currentOperation) {
        case 0:
            NSLog(@"You chose option 0");
            self.label.text = [NSString stringWithFormat:@"%6.0f", result];
            break;
        default:
            currentNumber = 0;
            break;
    }
    
   

}



@end
