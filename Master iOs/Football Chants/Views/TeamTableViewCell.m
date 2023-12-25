//
//  TeamTableViewCell.m
//  Master iOs
//
//  Created by Trung DX on 24/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "TeamTableViewCell.h"
#import "Team.h"

NSString *const cellId = @"TeamTableViewCell_Id";

@implementation TeamTableViewCell

// MARK: UI

- (UILabel*)getNameView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
    label.translatesAutoresizingMaskIntoConstraints = false;
    label.text = self.teamData.name;
    label.font = [UIFont fontWithName:@"systemFont" size:18] ;
    label.font = [UIFont boldSystemFontOfSize:16];
    return label;
}
- (UILabel*)getInfoView {
    UILabel *info = [[UILabel alloc] init];
    info.translatesAutoresizingMaskIntoConstraints = false;
    info.numberOfLines = 0;
    info.text = self.teamData.info;
    return info;
}

- (UIStackView*)getContainerView {
    UIStackView *containerView = [[UIStackView alloc]init ];
    containerView.translatesAutoresizingMaskIntoConstraints = false;
    containerView.spacing = 8;
    containerView.distribution = UIStackViewDistributionFill;
    containerView.alignment = UIStackViewAlignmentCenter;
    return containerView;
}

- (UIStackView*)getMiddleView {
    UIStackView *middleView = [[UIStackView alloc]init ];
    middleView.axis = UILayoutConstraintAxisVertical;
    middleView.spacing = 4;
    middleView.translatesAutoresizingMaskIntoConstraints = false;
    return middleView;
}

- (void)configure:(Team*) team{
    self.teamData = team;
    UIColor *bgColor =  [team getTeamColor];
    self.backgroundColor = bgColor;
    
    UIStackView *containerView = [self getContainerView];
    UIStackView *middleView = [self getMiddleView];
    
    UIImageView *badgeView =  [team getTeamBadge];
    badgeView.translatesAutoresizingMaskIntoConstraints = false;
    
    UILabel *nameView = [self getNameView];
    UILabel *infoView = [self getInfoView];
  

    [self.contentView addSubview:containerView];
    
    [middleView addArrangedSubview:nameView];
    [middleView addArrangedSubview:infoView];
    
    [containerView addArrangedSubview:badgeView];
    [containerView addArrangedSubview:middleView];
    
    [NSLayoutConstraint activateConstraints:@[
            [containerView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
            [containerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
            [containerView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
            [containerView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
            
            // style badge view
            [badgeView.heightAnchor constraintEqualToConstant:50],
            [badgeView.widthAnchor constraintEqualToConstant:50],
            [badgeView.topAnchor constraintEqualToAnchor:containerView.topAnchor constant:16],
            [badgeView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor constant:8],
            
            // style middle view and content
            [middleView.topAnchor constraintEqualToAnchor:containerView.topAnchor constant:16],
//            [middleView.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor constant:-16],
            [middleView.leadingAnchor constraintEqualToAnchor:badgeView.trailingAnchor constant:8],
//            [middleView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
            
            [nameView.topAnchor constraintEqualToAnchor:middleView.topAnchor],
            [nameView.leadingAnchor constraintEqualToAnchor:middleView.leadingAnchor],
            [nameView.trailingAnchor constraintEqualToAnchor:middleView.trailingAnchor],
    ]];
}

@end
