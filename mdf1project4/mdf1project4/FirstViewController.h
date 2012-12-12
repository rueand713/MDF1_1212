//
//  FirstViewController.h
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <NSURLConnectionDataDelegate, UITableViewDelegate, NSXMLParserDelegate>
{
    // UITableView outlet for the IB
    IBOutlet UITableView *myTableView;
    
    // the objects used for the remote data
    NSURL *url;
    NSURLRequest *request;
    NSURLConnection *connection;
    NSMutableData *requestData;
    NSString *requestString;
    
    // the objects for holding the weather data
    NSArray *listTitles;
    NSString *credit;
    NSString *location;
    NSString *station;
    NSString *lon;
    NSString *lat;
    NSString *updateTime;
    NSString *conditions;
    NSString *temp;
    NSString *humidity;
    NSString *wind;
    NSString *dewpoint;
    NSString *visibility;
    NSString *currentElement;
}

@end
