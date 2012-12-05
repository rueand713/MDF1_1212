//
//  FirstViewController.h
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

// this view implements the custom mapgram delegate
@interface FirstViewController : UIViewController <UITableViewDelegate, mapgram>
{
    // outlets for the tableView and ui buttons
    IBOutlet UITableView *myTableView;
    IBOutlet UIButton *doneButton;
    IBOutlet UIButton *editButton;
    
    // mutable arrays for use in the table, allowing the items to be removed
    // during the editing mode
    NSMutableArray *businessLocations;
    NSMutableArray *businesses;
    NSMutableArray *businessCoords;
    
    // these will be copies of the mutable variants for use in passing
    // unmodified data back to the second view
    NSArray *masterCoordRecord;
    NSArray *masterBusinessRecord;
}

// the click handler for the edit and done buttons
-(IBAction)onClick:(id)sender;

@end
