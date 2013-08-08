//
//  UITextView+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 8/8/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Opetopic)

/**
 UITextView instances come with a bit of internal padding naturally,
 and unfortunately it can vary by version of iOS. So this method
 returns what we've calculated the insets to be.
 */
+(UIEdgeInsets) textEdgeInsets;

/**
 Sets the frame of the text view but applies the inverse insets
 from +textEdgeInsets so that the text matches as closely as 
 possibly to the given frame.
 */
-(void) setFrameAndUndoInset:(CGRect)frame;

@end
