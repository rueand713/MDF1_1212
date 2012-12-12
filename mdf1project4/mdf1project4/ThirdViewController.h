//
//  ThirdViewController.h
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    IBOutlet UITextView *myTextView;
    IBOutlet UILabel *titleLabel;
    
    NSString *text;
    NSString *cityText;
}

- (IBAction)onClick:(id)sender;

@property (assign) NSString *text;
@property (assign) NSString *cityText;
@end
