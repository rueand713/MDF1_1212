//
//  AppAnnotations.h
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

// implements the MKAnnotation for the  mapkit
@interface AppAnnotations : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

// custom init function for annotation creation
- (id)initWithTitle:(NSString *)_title coords:(CLLocationCoordinate2D)coords;

// properties for setting the annotation data within the init
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
