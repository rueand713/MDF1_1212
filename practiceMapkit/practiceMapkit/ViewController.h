//
//  ViewController.h
//  practiceMapkit
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMapAnnotations.h"

@interface ViewController : UIViewController
{
    // an outlet to the map in xib
    IBOutlet MKMapView *myMapView;
}

@end
