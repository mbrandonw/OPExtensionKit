//
//  UIResponder+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 3/10/14.
//  Copyright (c) 2014 Opetopic. All rights reserved.
//

#import "UIResponder+Opetopic.h"
#import "UIViewController+Opetopic.h"
#import "OPMacros.h"

@implementation UIResponder (Opetopic)

-(UIViewController*) viewController {
  UIViewController *controller = OPTypedAs(self.nextResponder, UIViewController);
  if ([self.class isSubclassOfClass:controller.viewClass]) {
    return controller;
  }
  return self.nextResponder.viewController;
}

@end
