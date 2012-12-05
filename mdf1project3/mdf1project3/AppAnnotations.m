//
//  AppAnnotations.m
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "AppAnnotations.h"

@implementation AppAnnotations

@synthesize title, coordinate;

// custom init
- (id)initWithTitle:(NSString *)_title coords:(CLLocationCoordinate2D)coords
{
    if (self = [super init])
    {
        // set the title and coordinate values to the values initialized with the annotation
        // passed in as arguments
        title = _title;
        coordinate = coords;
    }
    
    return  self;
}

@end
