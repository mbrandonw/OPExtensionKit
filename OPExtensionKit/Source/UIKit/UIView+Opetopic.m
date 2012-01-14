//
//  UIView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/25/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIView+Opetopic.h"

@implementation UIView (Opetopic)

-(CGFloat) left {
	return self.frame.origin.x;
}

-(void) setLeft:(CGFloat)x {
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

-(CGFloat) right {
	return self.frame.origin.x + self.frame.size.width;
}

-(void) setRight:(CGFloat)right {
	CGRect frame = self.frame;
	frame.origin.x = right - frame.size.width;
	self.frame = frame;
}

-(CGFloat) top {
	return self.frame.origin.y;
}

-(void) setTop:(CGFloat)y {
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

-(CGFloat) bottom {
	return self.frame.origin.y + self.frame.size.height;
}

-(void) setBottom:(CGFloat)bottom {
	CGRect frame = self.frame;
	frame.origin.y = bottom - frame.size.height;
	self.frame = frame;
}

-(CGFloat) width {
	return self.frame.size.width;
}

-(void) setWidth:(CGFloat)width {
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

-(CGFloat) height {
	return self.frame.size.height;
}

-(void) setHeight:(CGFloat) height {
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

-(void) setSize:(CGSize)size {
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

-(CGSize) size {
	return self.frame.size;
}

- (CGFloat)centerX {
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX {
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY {
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY {
    [self setCenter:CGPointMake(self.center.x, centerY)];
}

-(void) hideAllSubviews {
	
	for (UIView *s in self.subviews)
		s.hidden = YES;
}

-(void) removeAllSubviews {
    
    while ([self.subviews count])
        [[self.subviews lastObject] removeFromSuperview];
}

-(void) recDesc {
#ifdef DEBUG
    [self performSelector:@selector(recursiveDescription)];
#endif
}

@end
