//
//  LocationController.m
//  Master iOs
//
//  Created by admin on 21/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "LocationController.h"
#import "Location.h"

@implementation LocationController

- (NSArray*)getPointsOfInterest {
	NSMutableArray *locations =[[NSMutableArray alloc] init];
	
	//read data from JSON file and push into array
	
	NSDictionary *dict = [self JSONFromFile];
	NSArray *points = [dict objectForKey:@"points"];
	
	for (NSDictionary *point in points) {
		NSString *address = [point objectForKey:@"address"];
		if(address != nil){
			Location *parsedPoint = [[Location alloc] init];
			parsedPoint.address = address;
			parsedPoint.photo = [point objectForKey:@"photo"];
			parsedPoint.latitude = [[point objectForKey:@"latitude"] floatValue];
            parsedPoint.longtitude = [[point objectForKey:@"longtitude"] floatValue];
			parsedPoint.id = [point objectForKey:@"id"];
			
			[locations addObject:parsedPoint];
		}
	}
	return  locations;
}


// The return value is either NSArray * or NSDictionary *
- (id)JSONFromFile
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Location" ofType:@"json"];
	NSData *data = [NSData dataWithContentsOfFile:path];
	return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}



@end
