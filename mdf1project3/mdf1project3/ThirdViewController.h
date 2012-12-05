//
//  ThirdViewController.h
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppAnnotations.h"

@interface ThirdViewController : UIViewController
{
    // create outlets for the IB objects
    IBOutlet MKMapView *mapView;
    IBOutlet UILabel *businessName;
    IBOutlet UILabel *businessLat;
    IBOutlet UILabel *businessLon;
    
    // these will be set from between views
    // via passed in / retrieved data
    NSString *nameText;
    NSString *locText;
    float latitude;
    float longitude;
}

// the click handler for the back button
-(IBAction)onClick:(id)sender;

// properties set for setting the map data
@property (assign) float latitude;
@property (assign) float longitude;
@property (assign) NSString *nameText;
@property (assign) NSString *locText;
@end
