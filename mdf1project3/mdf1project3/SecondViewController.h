//
//  SecondViewController.h
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppAnnotations.h"

// custom delegate used for fetching the map data
@protocol mapgram <NSObject>

@required
-(NSArray *)retrieveCoordList;

@end

@interface SecondViewController : UIViewController
{
    // outlet for the fullscreen map
    IBOutlet MKMapView *completeMap;
    
    // will hold the passed in data from the delegate
    NSArray *coordsList;
    
    // holdes an array of annotations
    NSMutableArray *annotationsList;
    
    // keep track of whether the map has been annotated before
    BOOL firstLoad;
    
    id<mapgram> mapDelegate;
}

// property to access the custom mapDelegate
@property (strong) id<mapgram> mapDelegate;

@end
