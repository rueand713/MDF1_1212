//
//  FirstViewController.h
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <NSURLConnectionDataDelegate, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSURL *url;
    NSURLRequest *request;
    NSURLConnection *connection;
    
    NSArray *tableData;
    NSMutableData *requestData;
}

@end
