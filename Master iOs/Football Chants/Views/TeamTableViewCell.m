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
    containerView.layer.cornerRadius = 8;
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


- (UIButton*)getButtonView {
    UIButton *buttonView = [[UIButton alloc]init ];
    buttonView.translatesAutoresizingMaskIntoConstraints = false;
    buttonView.tintColor = [UIColor whiteColor];
    [buttonView setImage:[UIImage systemImageNamed:@"play.circle" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:44]] forState:UIControlStateNormal];
    return buttonView;
}

- (void)configure:(Team*) team{
    self.teamData = team;
    UIColor *bgColor =  [team getTeamColor];

    UIStackView *containerView = [self getContainerView];
    containerView.backgroundColor = bgColor;
   
    
    UIImageView *badgeView =  [team getTeamBadge];
    badgeView.translatesAutoresizingMaskIntoConstraints = false;
    
    UIStackView *middleView = [self getMiddleView];
    UILabel *nameView = [self getNameView];
    UILabel *infoView = [self getInfoView];
    
    UIButton *buttonView = [self getButtonView];
  
    [self.contentView addSubview:containerView];
    
    [containerView addArrangedSubview:badgeView];
    [containerView addArrangedSubview:middleView];
    [containerView addArrangedSubview:buttonView];
    
    [middleView addArrangedSubview:nameView];
    [middleView addArrangedSubview:infoView];
    
    [NSLayoutConstraint activateConstraints:@[
            [containerView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
            [containerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8],
            [containerView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
            [containerView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16],
            
            // style badge view
            [badgeView.widthAnchor constraintEqualToConstant:50],
            [badgeView.topAnchor constraintEqualToAnchor:middleView.topAnchor],
            [badgeView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor constant:8],
            
            // style middle view and content
            [middleView.topAnchor constraintEqualToAnchor:containerView.topAnchor constant:16],
            [middleView.leadingAnchor constraintEqualToAnchor:badgeView.trailingAnchor constant:8],
//          [middleView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
            
            [nameView.topAnchor constraintEqualToAnchor:middleView.topAnchor],
            [nameView.leadingAnchor constraintEqualToAnchor:middleView.leadingAnchor],
            [nameView.trailingAnchor constraintEqualToAnchor:middleView.trailingAnchor],
            
            [infoView.topAnchor constraintEqualToAnchor:nameView.bottomAnchor constant:4],
            [infoView.leadingAnchor constraintEqualToAnchor:middleView.leadingAnchor],
            [infoView.trailingAnchor constraintEqualToAnchor:middleView.trailingAnchor],
            
            // style button view
          
            [buttonView.leadingAnchor constraintEqualToAnchor:middleView.trailingAnchor constant:8],
            [buttonView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor constant:-8],
    ]];
}

@end
