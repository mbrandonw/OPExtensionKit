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

@end
