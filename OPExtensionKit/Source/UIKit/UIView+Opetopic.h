//
//  UIView+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/25/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** UIView Extensions
 
 Extensions to UIView for obtaining basic geometric information
 and better handling of subviews.
 */

#import <UIKit/UIKit.h>

static inline CGSize CGSizeAspectFit(CGSize size, CGSize maxSize) {
    CGSize retVal = maxSize;
    if (size.width/size.height > maxSize.width/maxSize.height)
    {
        retVal.height = roundf(maxSize.width * size.height/size.width);
    }
    else
    {
        retVal.width = roundf(maxSize.height * size.width/size.height);
    }
    return retVal;
}

static inline CGRect CGRectAspectFit(CGRect rect, CGRect maxRect) {
    CGRect retVal = maxRect;
    if (rect.size.width/rect.size.height > maxRect.size.width/maxRect.size.height)
    {
        retVal.size.height = roundf(maxRect.size.width * rect.size.height/rect.size.width);
        retVal.origin.y += roundf((maxRect.size.height - retVal.size.height) / 2.0f);
    }
    else
    {
        retVal.size.width = roundf(maxRect.size.height * rect.size.width / rect.size.height);
        retVal.origin.x += roundf((maxRect.size.width - retVal.size.width) / 2.0f);
    }
    return retVal;
}

enum {
    UIViewAutoresizingFlexibleSize = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight,
    UIViewAutoresizingFlexibleMargins = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin,
    UIViewAutoresizingFlexibleAll = UIViewAutoresizingFlexibleSize | UIViewAutoresizingFlexibleMargins,
};

@interface UIView (Opetopic)

/**
 The view's left most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat left;

/**
 The view's right most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat right;

/**
 The view's top most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat top;

/**
 The view's bottom most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat bottom;

/**
 The view's top-left point.
 */
@property (nonatomic, assign) CGPoint origin;

/**
 The view's width.
 */
@property (nonatomic, assign) CGFloat width;

/**
 The view's height.
 */
@property (nonatomic, assign) CGFloat height;

/**
 The view's size struct.
 */
@property (nonatomic, assign) CGSize size;

/**
 The view's center's x-coordinate.
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 The view's center's y-coordinate.
 */
@property (nonatomic, assign) CGFloat centerY;

/**
 Just a helper method to kill two birds with one stone.
 */
-(void) setNeedsDisplayAndLayout;

/**
 Add a subview to the back of the hierarcy.
 */
-(void) addSubviewToBack:(UIView *)view;

/**
 Hides all of the view's subviews.
 */
-(void) hideAllSubviews;

/**
 Removes all of the view's subviews.
 */
-(void) removeAllSubviews;

/**
 */
-(void) bringToFront;
-(void) sendToBack;

/**
 Renders the view into a UIImage.
 */
-(UIImage*) renderedImage;

/**
 Easy access to `recursiveDescription`. Don't worry, this is App Store safe.
 */
-(NSString*) rDescription;

@end
