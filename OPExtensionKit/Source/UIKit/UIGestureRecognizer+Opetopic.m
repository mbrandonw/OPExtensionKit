//
//  UIGestureRecognizer+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/22/14.
//  Copyright (c) 2014 Opetopic. All rights reserved.
//

#import "UIGestureRecognizer+Opetopic.h"

@implementation UIGestureRecognizer (Opetopic)

-(BOOL) isTracking {
  return (self.state == UIGestureRecognizerStateBegan || self.state == UIGestureRecognizerStateChanged);
}

-(void) cancelRecognizer {
  BOOL enabled = self.enabled;
  self.enabled = NO;
  self.enabled = enabled;
}

@end
