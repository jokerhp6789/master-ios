//
//  Team.m
//  Master iOs
//
//  Created by Trung DX on 23/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Team.h"

@implementation Team


-(UIImageView *)getTeamBadge:(TeamType)team {
    UIImageView *image = [[UIImageView alloc] init ];
    image.translatesAutoresizingMaskIntoConstraints = false;
    image.contentMode = UIViewContentModeScaleAspectFit;
    switch (team) {
        case arsenal:
            [image setImage:[UIImage imageNamed:@"arsenal_ic"]];
            return image;
        default:
            return nil;;
    }
}

- (UIColor *)getTeamColor:(TeamType)team {
    switch (team) {
        case arsenal:
            return [UIColor colorNamed:@"arsenal_bg"];
        case chelsea:
            return [UIColor colorNamed:@"chelsea_bg"];
        default:
            return nil;;
    }
    
}

@end

