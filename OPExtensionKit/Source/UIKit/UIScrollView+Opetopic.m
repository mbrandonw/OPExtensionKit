//
//  UIScrollView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 3/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIScrollView+Opetopic.h"

@implementation UIScrollView (Opetopic)

-(void) setContentInsetLeft:(CGFloat)contentInsetLeft {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, contentInsetLeft, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat) contentInsetLeft {
    return self.contentInset.left;
}

-(void) setContentInsetRight:(CGFloat)contentInsetRight {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, contentInsetRight);
}

-(CGFloat) contentInsetRight {
    return self.contentInset.right;
}

-(void) setContentInsetTop:(CGFloat)contentInsetTop {
    self.contentInset = UIEdgeInsetsMake(contentInsetTop, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat) contentInsetTop {
    return self.contentInset.top;
}

-(void) setContentInsetBottom:(CGFloat)contentInsetBottom {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, contentInsetBottom, self.contentInset.right);
}

-(CGFloat) contentInsetBottom {
    return self.contentInset.bottom;
}

-(void) setScrollIndicatorInsetLeft:(CGFloat)scrollIndicatorInsetLeft {
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.scrollIndicatorInsets.top, scrollIndicatorInsetLeft, self.scrollIndicatorInsets.bottom, self.scrollIndicatorInsets.right);
}

-(CGFloat) scrollIndicatorInsetLeft {
    return self.scrollIndicatorInsets.left;
}

-(void) setScrollIndicatorInsetRight:(CGFloat)scrollIndicatorInsetRight {
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.scrollIndicatorInsets.top, self.scrollIndicatorInsets.left, self.scrollIndicatorInsets.bottom, scrollIndicatorInsetRight);
}

-(CGFloat) scrollIndicatorInsetRight {
    return self.scrollIndicatorInsets.right;
}

-(void) setScrollIndicatorInsetTop:(CGFloat)scrollIndicatorInsetTop {
    self.scrollIndicatorInsets = UIEdgeInsetsMake(scrollIndicatorInsetTop, self.scrollIndicatorInsets.left, self.scrollIndicatorInsets.bottom, self.scrollIndicatorInsets.right);
}

-(CGFloat) scrollIndicatorInsetTop {
    return self.scrollIndicatorInsets.top;
}

-(void) setScrollIndicatorInsetBottom:(CGFloat)scrollIndicatorInsetBottom {
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.scrollIndicatorInsets.top, self.scrollIndicatorInsets.left, scrollIndicatorInsetBottom, self.scrollIndicatorInsets.right);
}

-(CGFloat) scrollIndicatorInsetBottom {
    return self.scrollIndicatorInsets.bottom;
}

-(void) setContentOffsetX:(CGFloat)contentOffsetX {
    [self setContentOffsetX:contentOffsetX animated:NO];
}

-(CGFloat) contentOffsetX {
    return self.contentOffset.x;
}

-(void) setContentOffsetY:(CGFloat)contentOffsetY {
    [self setContentOffsetY:contentOffsetY animated:NO];
}

-(CGFloat) contentOffsetY {
    return self.contentOffset.y;
}

-(void) setContentOffsetX:(CGFloat)x animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(x, self.contentOffset.y) animated:animated];
}

-(void) setContentOffsetY:(CGFloat)y animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(self.contentOffset.x, y) animated:animated];
}

-(void) setContentSizeWidth:(CGFloat)width {
  self.contentSize = CGSizeMake(width, self.contentSize.height);
}

-(CGFloat) contentSizeWidth {
  return self.contentSize.width;
}

-(void) setContentSizeHeight:(CGFloat)height {
  self.contentSize = CGSizeMake(self.contentSize.width, height);
}

-(CGFloat) contentSizeHeight {
  return self.contentSize.height;
}

-(BOOL) scrolledToTop {
  return self.contentOffsetY == -self.contentInsetTop;
}

-(void) scrollRectToVisible:(CGRect)rect animated:(BOOL)animated position:(UITableViewScrollPosition)position {

  CGRect visibleRect = UIEdgeInsetsInsetRect(self.bounds, self.contentInset);
  CGFloat offset = rect.origin.y;
  switch (position) {
    case UITableViewScrollPositionBottom:
      offset -= visibleRect.size.height - rect.size.height;
      break;
    case UITableViewScrollPositionMiddle:
      offset -= visibleRect.size.height/2.0f - rect.size.height/2.0f;
      break;
    case UITableViewScrollPositionTop:
      break;
    default:
      break;
  }

  [self setContentOffsetY:offset animated:animated];
}

@end
