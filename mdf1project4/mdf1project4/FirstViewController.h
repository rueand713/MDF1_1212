//
//  FirstViewController.h
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface FirstViewController : UIViewController <NSURLConnectionDataDelegate, UITableViewDelegate, NSXMLParserDelegate, xmlViewer>
{
    // UITableView outlet for the IB
    IBOutlet UITableView *myTableView;
    
    // city info
    NSArray *cities;
    NSString *currentCity;
    
    // the objects used for the remote data
    NSURL *url;
    NSURLRequest *request;
    NSURLConnection *connection;
    NSMutableData *requestData;
    NSString *requestString;
    
    // array for the list titles
    NSArray *listTitles;
    
    // the objects for holding the weather data
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
    NSString *windChill;
    NSString *pressure;
    NSString *altimeter;
    NSString *dewpoint;
    NSString *visibility;
    NSString *currentElement;
    
    // NSXMLParser parse controller boolean
    BOOL parseController;
    
    // Weather Locations URLs
    NSArray *weatherLocales;
}

- (void)callDetailView:(NSString *)details;
- (void)fetchXML:(NSString *)urlToXML;
- (IBAction)onClick:(id)sender;

@end
