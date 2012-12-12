//
//  SecondViewController.h
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

// creating a custom protocol to retrieve data from the first tab
@protocol xmlViewer <NSObject>

@required
- (NSString *)xmlDataString;

@end

@interface SecondViewController : UIViewController
{
    // textView outlet for the IB
    IBOutlet UITextView *textView;
    
    // custom delegate
    id<xmlViewer> delegate;
}

// setting the delegate an accessor
@property (strong) id<xmlViewer> delegate;

@end
