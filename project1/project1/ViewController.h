//
//  ViewController.h
//  project1
//
//  Created by Rueben Anderson on 11/24/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *doneButton;
    NSMutableArray *destinations;
    NSMutableArray *priority;
    BOOL editingMode;
}

// the click handler for the edit and done buttons
- (IBAction)onClick:(id)sender;

@end
