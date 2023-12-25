//
//  ChantsVIewController.m
//  Master iOs
//
//  Created by Trung DX on 23/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "ChantsVIewController.h"
#import "Team.h"
#import "TeamTableViewCell.h"
#import "TeamViewModel.h"

@implementation ChantsVIewController

// MARK: - INIT UI

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
    [self setUpView];
}

//- (void)loadView {
//    [super loadView];
//    [self loadData];
//    [self setUpView];
//}

// MARK: - LOAD DATA

-(void)loadData {
    self.teams = TEAM_DATA;
}

-(Team *) getTeamByIndex:(NSUInteger) index {
    NSDictionary *foundData = self.teams[index];
    Team *foundTeam = [[Team alloc] init];
    NSDictionary *foundDataId = foundData[@"id"];
    foundTeam.id = foundDataId;
    foundTeam.name = foundData[@"name"];
    foundTeam.info = foundData[@"info"];
    foundTeam.manager.name = foundData[@"manager"][@"name"];
    foundTeam.manager.job = foundData[@"manager"][@"job"];
    foundTeam.founded = foundData[@"founded"];
    return  foundTeam;
}


// MARK: - SETUP UI

-(void)setUpView {
    UITableView *tableView = [[UITableView alloc] init ];
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 100;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor grayColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [tableView registerClass:[TeamTableViewCell class] forCellReuseIdentifier:cellId];
    tableView.dataSource = self; // assign all the method required by the UITableDataSource protocol which are implemented in the UITableView protocol MARK  to the tableView obj
    
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [_tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [_tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [_tableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [_tableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
    ]];
}

// MARK: - UITableView protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.teams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    Team *team = [[Team alloc] init];
//    UIColor *teamColor = [team getTeamColor:chelsea];
//    switch (indexPath.row) {
//        case 0:
//            cell.backgroundColor = [UIColor redColor];
//            break;
//        case 1:
//            cell.backgroundColor = [UIColor orangeColor];
//            break;
//        case 2:
//            cell.backgroundColor = teamColor;
//            break;
//        default:
//            break;
//    }
    
    Team *team = [self getTeamByIndex:indexPath.row];
    
    [cell configure:team];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
