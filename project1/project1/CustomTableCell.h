//
//  CustomTableCell.h
//  project1
//
//  Created by Rueben Anderson on 11/24/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    IBOutlet UILabel *textLabel;
    IBOutlet UILabel *priorityLabel;
}

// setter for the second string in the customTableCell
@property (assign) UILabel *priorityLabel;

@end
