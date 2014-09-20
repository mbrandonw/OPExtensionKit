//
//  NSAttributedString+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 8/2/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (Opetopic)

-(void) drawInRect:(CGRect)rect parentBounds:(CGRect)bounds;
-(CGSize) sizeContrainedTo:(CGSize)constraints;
-(CTFramesetterRef) framesetterRef;

@end
