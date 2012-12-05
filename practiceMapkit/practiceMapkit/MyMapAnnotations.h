//
//  MyMapAnnotations.h
//  practiceMapkit
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

// annotation class that implements the MKAnnotation delegate
@interface MyMapAnnotations : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

// a customized init function
- (id)initWithTitle:(NSString *)_title coord:(CLLocationCoordinate2D)coord;

// property values that must be changed only in the init
@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
