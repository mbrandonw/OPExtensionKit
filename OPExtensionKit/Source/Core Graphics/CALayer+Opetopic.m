//
//  CALayer+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/3/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "CALayer+Opetopic.h"

@implementation CALayer (Opetopic)

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

-(void) setNeedsDisplayAndLayout {
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

-(void) addSublayerToBack:(CALayer *)layer {
    [self insertSublayer:layer atIndex:0];
}

-(void) hideAllSublayers {
	
	for (CALayer *l in self.sublayers)
		l.hidden = YES;
}

-(void) removeAllSublayers {
    
    while ([self.sublayers count])
        [[self.sublayers lastObject] removeFromSuperlayer];
}

@end
