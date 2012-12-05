//
//  ViewController.m
//  practiceMapkit
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    MKCoordinateSpan span;
    span.latitudeDelta = 40.0f;
    span.longitudeDelta = 40.0f;
    
    // create the CLLocation2d object and set its latitude and longitude properties
    CLLocationCoordinate2D houstonLocation;
    houstonLocation.latitude = 29.7631f;
    houstonLocation.longitude = -95.3631f;
    
    MKCoordinateRegion region;
    region.center = houstonLocation;
    region.span = span;
    myMapView.region = region;
    
    // create an annotations object
    MyMapAnnotations *annotation = [[MyMapAnnotations alloc] initWithTitle:@"Houston" coord:houstonLocation];
    if (annotation != nil)
    {
        // pass in the annotation to the map
        [myMapView addAnnotation:annotation];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
