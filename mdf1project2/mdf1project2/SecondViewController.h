//
//  SecondViewController.h
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTable;
    IBOutlet UIView *detailView;
    IBOutlet UITextView *detailText;
    IBOutlet UILabel *titleLabel;
    CGRect originalFrame;
    NSArray *subTopics;
}

- (IBAction)onClick:(id)sender;
@end
