//
//  ThirdViewController.m
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

@synthesize latitude, longitude, nameText, locText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // set the map info labels text (business name, lat, & lon)
    businessName.text = [[NSString alloc] initWithFormat:@"%@ (%@)", nameText, locText];
    businessLat.text = [[NSString alloc] initWithFormat:@" Latitude: %f", latitude];
    businessLon.text = [[NSString alloc] initWithFormat:@" Longitude: %f", longitude];
    
    // create a span object and set it to a very close zoom
    MKCoordinateSpan span;
    span.latitudeDelta = 0.5f;
    span.longitudeDelta = 0.5f;
    
    // set the locationCoordinate object data
    CLLocationCoordinate2D location;
    location.longitude = longitude;
    location.latitude = latitude;
    
    // create the region object and set the region and focal point
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    // creates an annotation object for adding to the map
    AppAnnotations *mapAnnotations = [[AppAnnotations alloc] initWithTitle:nameText coords:location];
    
    if (mapAnnotations != nil)
    {
        // adds the annotion to the map
        [mapView addAnnotation:mapAnnotations];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    // create an button from the sender argument
    UIButton *button = (UIButton *)sender;
    
    if (button != nil)
    {
        // close the current view and return to the first view
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

@end
