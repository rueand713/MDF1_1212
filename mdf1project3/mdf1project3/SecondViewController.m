//
//  SecondViewController.m
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize mapDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        // set the firstload to true
        firstLoad = YES;
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    // check if this is the first load of the map
    // if it is there are no annotations to remove so this condition will be skipped
    // if it isn't the first load there are previous annotations that should be removed to update the map
    if (firstLoad == NO)
    {
        // since it isn't the first load, check if there are any annotations stored in the array
        // if there are remove them
        if (annotationsList != nil && [annotationsList count] > 0)
        {
            // remove the annotations
            [completeMap removeAnnotations:annotationsList];
        }
    }
    else if (firstLoad == YES)
    {
        // set the first load to false now since it is now loaded at least once
        firstLoad = NO;
    }
    
    // fetch the map data needed from the first view
    // stores it in an global array object for access in other functions
    coordsList = [mapDelegate retrieveCoordList];
    
    // store the passed in arguments into their own arrays for ease
    // the data passed in is the coordinates and business name arrays from the first view
    NSArray *parsedCoordinates = [coordsList objectAtIndex:0];
    NSArray *parsedLocations = [coordsList objectAtIndex:1];
    
    // create an array to house the annotations that will be dynamically
    // created via the arrays and a for-loop
    annotationsList = [[NSMutableArray alloc] init];
    
    // set the span data
    MKCoordinateSpan span;
    span.latitudeDelta = 20.0f;
    span.longitudeDelta = 20.0f;
    
    // set the region data
    MKCoordinateRegion region;
    region.span = span;
    
    // loops through the number of locations dynamically creating a CLLocationCoordinate2d object
    // and map annotation then stores it into an array until the loop ends. The array of annotations will then be
    // added to the map view
    for (int i = 0; i < [parsedLocations count]; i++)
    {
        // create a string to send into the annotations initialization for the title
        // this is based on the passed in locations argument data
        NSString *anoTitle = [parsedLocations objectAtIndex:i];
        
        // create a locationCoordinate object based on the passed in lat and lon data
        // this data is stored in an array so that it may be accessed dynamically through looping
        CLLocationCoordinate2D location;
        location.longitude = [[[parsedCoordinates objectAtIndex:i] objectAtIndex:1] floatValue];
        location.latitude = [[[parsedCoordinates objectAtIndex:i] objectAtIndex:0] floatValue];
        
        // centers the map on the first location added
        if (i < 1)
        {
            // set the region and its focal point
            region.center = location;
            completeMap.region = region;
        }
        
        // create an annotation object for each loop
        AppAnnotations *thisAnnotation = [[AppAnnotations alloc] initWithTitle:anoTitle coords:location];
        
        if (thisAnnotation != nil)
        {
            // adds the annotation to an annotation array that will be used
            // to add all of the annotations at once to the map
            [annotationsList addObject:thisAnnotation];
        }
        
    }
    
    // verifies that the annotionList array is indeed created with objects
    if (annotationsList != nil)
    {
        // adds the annotations from the array to the map view
        [completeMap addAnnotations:annotationsList];
    }
    
    [super viewDidAppear:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
