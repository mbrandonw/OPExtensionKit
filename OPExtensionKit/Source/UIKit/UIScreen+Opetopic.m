//
//  UIScreen+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIScreen+Opetopic.h"
#import "UIDevice+Opetopic.h"

@implementation UIScreen (Opetopic)

+(BOOL) isTall {
    return self.class.mainScreen.bounds.size.height > 480.0f;
}

+(BOOL) isCompact {
  return self.class.isVerticallyCompact && self.class.isHorizontallyCompact;
}

+(BOOL) isVerticallyCompact {
  return self.class.mainScreen.bounds.size.height <= 320.0f;
}

+(BOOL) isHorizontallyCompact {
  return self.class.mainScreen.bounds.size.width <= 320.0f;
}

+(BOOL) isCompactPhone {
  return UIScreen.isCompact && UIDevice.isPhone;
}

-(CGRect) normalizedBounds {
  CGRect bounds = [self respondsToSelector:@selector(nativeBounds)] ? self.nativeBounds : self.bounds;
  CGFloat scale = [self respondsToSelector:@selector(nativeScale)] ? self.nativeScale : 1.0f;
  
  return (CGRect){
    bounds.origin.x / scale,
    bounds.origin.y / scale,
    bounds.size.width / scale,
    bounds.size.height / scale,
  };
}

-(BOOL) isHighResolution {
  return self.scale >= 1.5f;
}

-(CGFloat) aspectRatio {
  return MIN(self.bounds.size.width, self.bounds.size.height) / MAX(self.bounds.size.width, self.bounds.size.height);
}

@end
