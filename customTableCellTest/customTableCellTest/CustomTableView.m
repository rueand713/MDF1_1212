//
//  CustomTableView.m
//  customTableCellTest
//
//  Created by Rueben Anderson on 11/23/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
