//
//  Header.h
//  Master iOs
//
//  Created by admin on 18/10/2566 BE.
//

#ifndef Header_h
#define Header_h


#endif /* Header_h */
#import <UIKit/UIKit.h>

@interface CalculationApp : UIViewController {
    float currentNumber;
    float result;
    
    int currentOperation;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)onDigitsPress:(id)sender;
- (IBAction)onCancelPress:(id)sender;
- (IBAction)onOperationPress:(id)sender;
- (IBAction)onEqualPress:(id)sender;
//+ (float)getResultFromOperation:(int)operation withResult:(float)withResult andCurrentNumer:(float)andCurrentNumer;

@end
