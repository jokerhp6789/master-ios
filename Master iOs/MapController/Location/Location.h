//
//  Location.h
//  Master iOs
//
//  Created by admin on 21/12/2566 BE.
//

#ifndef Location_h
#define Location_h


#endif /* Location_h */


#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong,nonatomic) NSString *address;

@property (strong,nonatomic) NSString *photo;

@property (nonatomic) float latitude;
                    
@property (nonatomic) float longtitude;

@property (nonatomic) NSNumber *id;

@end
