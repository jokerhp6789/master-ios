//
//  ChantsVIewController.m
//  Master iOs
//
//  Created by Trung DX on 23/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "ChantsVIewController.h"

@implementation ChantsVIewController

// MARK: - INIT UI

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)loadView {
    [super loadView];
    [self setUpView];
}

// MARK: - SETUP UI

-(void)setUpView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero ];
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 44;
    tableView.backgroundColor = [UIColor grayColor];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor redColor];
            break;
             case 1:
            cell.backgroundColor = [UIColor orangeColor];
            break;
            
             case 2:
            cell.backgroundColor = [UIColor yellowColor];
            break;
            
        default:
            break;
    }
    return  cell;
}

@end
