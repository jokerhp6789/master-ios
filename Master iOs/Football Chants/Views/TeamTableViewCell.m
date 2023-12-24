//
//  TeamTableViewCell.m
//  Master iOs
//
//  Created by Trung DX on 24/12/2566 BE.
//

#import <Foundation/Foundation.h>
#import "TeamTableViewCell.h"

NSString *const cellId = @"TeamTableViewCell_Id";

@implementation TeamTableViewCell

// MARK: UI

- (UILabel*)nameView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
//    label.translatesAutoresizingMaskIntoConstraints = false;
    label.text = @"MANCHESTER UNITED";
    return label;
}

- (void)configure{
    UILabel *name = [self nameView];
    self.backgroundColor = [UIColor greenColor];
    [self addSubview:name];
}

@end
