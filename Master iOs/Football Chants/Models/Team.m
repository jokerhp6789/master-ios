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


-(UIImageView *)getTeamBadge {
    UIImageView *image = [[UIImageView alloc] init];
    image.translatesAutoresizingMaskIntoConstraints = false;
    image.contentMode = UIViewContentModeScaleAspectFit;
    switch ([self.id intValue]) {
        case arsenal:
            [image setImage:[UIImage imageNamed:@"arsenal_ic"]];
            return image;
        default:
            [image setImage:[UIImage imageNamed:@"arsenal_ic"]];
            return image;
    }
}

- (UIColor *)getTeamColor {
    switch ([self.id intValue]) {
        case arsenal:
            return [UIColor colorNamed:@"arsenal_bg"];
        case astonVilla:
            return [UIColor colorNamed:@"aston_villa_bg"];
        case burnley:
            return [UIColor colorNamed:@"burnley_bg"];
        case brighton:
            return [UIColor colorNamed:@"brighton_bg"];
        case chelsea:
            return [UIColor colorNamed:@"chelsea_bg"];
        default:
            return nil;;
    }
    
}

@end

