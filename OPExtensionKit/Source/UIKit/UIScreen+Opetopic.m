//
//  UIScreen+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIScreen+Opetopic.h"

@implementation UIScreen (Opetopic)

-(BOOL) isTall {
    return self.bounds.size.height > 480.0f;
}

-(BOOL) isHighResolution {
  return self.scale >= 1.5f;
}

-(CGFloat) aspectRatio {
  return MIN(self.bounds.size.width, self.bounds.size.height) / MAX(self.bounds.size.width, self.bounds.size.height);
}

@end
