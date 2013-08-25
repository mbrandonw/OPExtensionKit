//
//  UITextView+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 8/8/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "UITextView+Opetopic.h"

@implementation UITextView (Opetopic)

+(UIEdgeInsets) textEdgeInsets {
  if ([UIDevice isiOS7OrLater]) {
    return UIEdgeInsetsMake(11.0f, 5.0f, 11.0f, 5.0f);
  }
  return UIEdgeInsetsMake(12.0f, 9.0f, 12.0f, 9.0f);
}

-(void) setFrameAndUndoInset:(CGRect)frame {
  UIEdgeInsets insets = [UITextView textEdgeInsets];
  insets.top *= -1.0f;
  insets.left *= -1.0f;
  insets.bottom *= -1.0f;
  insets.right *= -1.0f;
  self.frame = UIEdgeInsetsInsetRect(frame, insets);
}

@end
