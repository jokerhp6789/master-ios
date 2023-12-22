//
//  LocationView.h
//  Master iOs
//
//  Created by admin on 22/12/2566 BE.
//

#ifndef LocationView_h
#define LocationView_h


#endif /* LocationView_h */
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Location.h"

@interface LocationView : UIViewController

@property (strong,nonatomic) MKMapView *mapView;

@property (strong,nonatomic) Location *activePoint;

@end
