//
//  MKMapView+Opetopic.h
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 11/11/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** MKMapView Extensions
 
 Extensions to MKMapView to make it even better!
 */

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol MKAnnotation;

@interface MKMapView (Opetopic)

/**
 Selects an annotation with animation (i.e. you don't need to pass an animation flag).
 */
-(void) selectAnnotationWithAnimation:(id<MKAnnotation>)annotation;

@end
