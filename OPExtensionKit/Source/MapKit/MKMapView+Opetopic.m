//
//  MKMapView+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 11/11/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "MKMapView+Opetopic.h"

@implementation MKMapView (Opetopic)

-(void) selectAnnotationWithAnimation:(id<MKAnnotation>)annotation {
	[self selectAnnotation:annotation animated:YES];
}

@end
