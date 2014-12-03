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
  return (CGRect){
    self.nativeBounds.origin.x / UIScreen.mainScreen.nativeScale,
    self.nativeBounds.origin.y / UIScreen.mainScreen.nativeScale,
    self.nativeBounds.size.width / UIScreen.mainScreen.nativeScale,
    self.nativeBounds.size.height / UIScreen.mainScreen.nativeScale,
  };
}

-(BOOL) isHighResolution {
  return self.scale >= 1.5f;
}

-(CGFloat) aspectRatio {
  return MIN(self.bounds.size.width, self.bounds.size.height) / MAX(self.bounds.size.width, self.bounds.size.height);
}

@end
