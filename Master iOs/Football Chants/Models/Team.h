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
    burnley,
    brighton,
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


typedef NS_ENUM(NSInteger,JobType) {
    manager = 0,
    headCoach,
};


@interface Manager : NSObject

@property (nonatomic) JobType job;

@property (strong,nonatomic) NSString *name;

@end



@interface Team : NSObject

@property (nonatomic) NSString *id;

@property (strong,nonatomic) NSString *name;

@property (strong,nonatomic) NSString *info;

@property (strong,nonatomic) NSString *founded;

@property (strong,nonatomic) Manager *manager;

@property (nonatomic) BOOL isPlaying;

- (UIColor*) getTeamColor;

- (UIImageView*) getTeamBadge;

@end
