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

@import UIKit;

#define UIViewControllerProperty(controllerClass, viewClass)      \
@interface viewClass (UIViewControllerProperty)                   \
@property (nonatomic, readonly) controllerClass *viewController;  \
@end                                                              \
@implementation viewClass (__viewcontroller__)                    \
-(controllerClass*) viewController {                              \
  return (controllerClass*)[super viewController];                \
}                                                                 \
@end                                                              \

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

static inline CGSize CGSizeAspectConstrain(CGSize size, CGSize maxSize) {
    if (size.width <= maxSize.width && size.height <= maxSize.height)
        return size;
    return CGSizeAspectFit(size, maxSize);
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
 Opposite of hidden.
 */
@property (nonatomic, assign) BOOL visible;

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
 */
@property (nonatomic, assign) CGPoint topLeft;
@property (nonatomic, assign) CGPoint topRight;
@property (nonatomic, assign) CGPoint bottomLeft;
@property (nonatomic, assign) CGPoint bottomRight;

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
 */
-(instancetype) initWithViewController:(UIViewController*)viewController;
-(instancetype) initWithFrame:(CGRect)frame viewController:(UIViewController*)viewController;
@property (nonatomic, strong) UIViewController *op_viewController;

/**
 Center this view within another view.
 */
-(void) centerXWithin:(UIView*)v;
-(void) centerYWithin:(UIView*)v;
-(void) centerWithin:(UIView*)v;
-(void) centerXWithinSuperview;
-(void) centerYWithinSuperview;
-(void) centerWithinSuperview;

/**
 For those times you just want to initialize with a size.
 */
-(instancetype) initWithSize:(CGSize)size;
+(instancetype) viewWithSize:(CGSize)size;

/**
 Convenience constructor
 */
+(instancetype) viewWithFrame:(CGRect)frame;

/**
 Just a helper method to kill two birds with one stone.
 */
-(void) setNeedsDisplayAndLayout;

/**
 Add a subview to the back of the hierarcy.
 */
-(void) addSubviewToBack:(UIView *)view;

/**
 */
-(void) addToSuperview:(UIView*)superview;

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
 */
-(void) sizeToFitWidth:(CGFloat)width;
-(void) sizeToFitAtMostWidth:(CGFloat)width;
-(void) sizeToFitAtLeastWidth:(CGFloat)width;
-(void) sizeToFitAtLeastWidth:(CGFloat)atLeast atMostWidth:(CGFloat)atMost;
-(CGSize) sizeThatFitsWidth:(CGFloat)width;

/**
 Renders the view into a UIImage.
 */
-(UIImage*) renderedImage;
-(UIImage*) renderedImage:(CGFloat)scale;

/**
 With the usual -animateWithDuration:animations:completion: method, if you pass a duration of 0 the completion block 
 is called on the next run loop cycle. This method forces the completion to be called immediately in this case.
 */
+(void) animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations asapCompletion:(void (^)(BOOL finished))completion;

/**
 */
+(void) transitionWithView:(UIView*)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;
+(void) transitionFromView:(UIView*)fromView toView:(UIView*)toView duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completion;

/**
 */
+(instancetype) autoLayoutView;

/**
 */
-(void) removeAllConstraints;

/**
 */
-(void) setContentCompressionResistanceAndHuggingPriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis;

/**
 */
-(void) recursivelySetSubviewBackgroundColor;
-(void) recursivelySetSubviewBackgroundColor:(UIColor*)color;

/**
 */
-(void) traverseSelfAndSubviews:(void(^)(UIView *subview))block;
-(void) traverseSubviews:(void(^)(UIView *subview))block;

/**
 */
@property (nonatomic, readonly, getter = isAnimating) BOOL animating;

/**
 */
@property (nonatomic, readonly) CGFloat bottomOfBottomMostVisibleSubview;

/**
 */
@property (nonatomic, readonly) NSArray *superviews;

@end
