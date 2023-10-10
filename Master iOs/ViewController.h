//
//  ViewController.h
//  Master iOs
//
//  Created by admin on 9/10/2566 BE.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController{
	IBOutlet UILabel *MyLabel;
}

@property (strong, nonatomic) IBOutlet UIButton *MyButton;
@property (weak, nonatomic) IBOutlet MKMapView *MapViewClass;
- (IBAction)myButtonPress:(id)sender;

@end

