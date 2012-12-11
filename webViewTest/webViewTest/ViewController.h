//
//  ViewController.h
//  webViewTest
//
//  Created by Rueben Anderson on 12/10/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>
{
    IBOutlet UIWebView *myWebView;
    IBOutlet UIBarButtonItem *backBtn;
    IBOutlet UIBarButtonItem *stopBtn;
}

- (IBAction)onClick:(id)sender;

@end
