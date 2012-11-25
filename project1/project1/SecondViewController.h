//
//  SecondViewController.h
//  project1
//
//  Created by Rueben Anderson on 11/24/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    IBOutlet UIButton *backButton;
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextView *detailtext;
    NSArray *receiver;
}

// click handler for the back button
- (IBAction)onClick:(id)sender;

// method for updating the UITtextView text and UILabel text
- (void)updateDetails:(NSIndexPath *)index destination:(NSString *)destination;

// receives and stores selected table cell data
@property (assign) NSArray *receiver;
@end
