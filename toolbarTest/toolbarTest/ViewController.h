//
//  ViewController.h
//  toolbarTest
//
//  Created by Rueben Anderson on 12/10/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIBarButtonItem *bartBtn;
    IBOutlet UIBarButtonItem *barBtn2;
    IBOutlet UILabel *headerLabel;
}

- (IBAction)onClick:(id)sender;

@end
