//
//  UIGestureRecognizer+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/22/14.
//  Copyright (c) 2014 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (Opetopic)

@property (nonatomic, readonly, getter = isTracking) BOOL tracking;

-(void) cancelRecognizer;

@end
