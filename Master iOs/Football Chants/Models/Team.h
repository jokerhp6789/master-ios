//
//  Team.h
//  Master iOs
//
//  Created by Trung DX on 23/12/2566 BE.
//

#ifndef Team_h
#define Team_h


#endif /* Team_h */

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,TeamType) {
    arsenal = 0,
    astonVilla,
    brighton,
    burnley,
    chelsea,
    everton,
    fulham,
    leeds,
    leicester,
    liverpool,
    manchesterUnited,
    manchesterCity,
    newcastle,
    palace,
    sheffield,
    southampton,
    tottenham,
    westBrom,
    wolves
    
};

@interface Team : NSObject

@property (nonatomic) TeamType id;

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *info;

@property (strong,nonatomic) NSString *founder;

@property (nonatomic) BOOL isPlaying;

- (UIColor*) getTeamColor:(TeamType) team;

- (UIImageView*) getTeamBadge:(TeamType) team;

@end
