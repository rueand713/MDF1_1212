//
//  MyMapAnnotations.m
//  practiceMapkit
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "MyMapAnnotations.h"

@implementation MyMapAnnotations

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)_title coord:(CLLocationCoordinate2D)coord
{
    if (self == [super init])
    {
        // sets the title and coordinate properties to the values passed from the annotation object
        // during the object initialization
        title = _title;
        coordinate = coord;
    }
    
    return self;
}

@end
