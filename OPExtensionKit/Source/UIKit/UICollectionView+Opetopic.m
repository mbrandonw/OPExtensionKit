//
//  UICollectionView+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 2/27/14.
//  Copyright (c) 2014 Kickstarter. All rights reserved.
//

#import "UICollectionView+Opetopic.h"

@implementation UICollectionView (Opetopic)

-(NSArray*) selectedCells {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSIndexPath *indexPath in self.indexPathsForSelectedItems) {
    [retVal addObject:[self cellForItemAtIndexPath:indexPath]];
  }
  return retVal;
}

@end
