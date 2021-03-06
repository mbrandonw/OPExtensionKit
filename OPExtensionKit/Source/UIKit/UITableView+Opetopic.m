//
//  UITableView+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 5/24/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "UITableView+Opetopic.h"
#import "NSObject+Opetopic.h"
#import "UIView+Opetopic.h"

@implementation UITableView (Opetopic)

-(NSArray*) indexPathsInSection:(NSUInteger)section {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger row = 0; row < [self.dataSource tableView:self numberOfRowsInSection:section]; row++)
    [retVal addObject:[NSIndexPath indexPathForRow:row inSection:section]];
  return retVal;
}

-(NSArray*) allIndexPaths {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger section = 0; section < [self.dataSource numberOfSectionsInTableView:self]; section++)
    [retVal addObjectsFromArray:[self indexPathsInSection:section]];
  return retVal;
}

-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger row = 0; row < [self.dataSource tableView:self numberOfRowsInSection:section]; row++)
  {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == type)
      [retVal addObject:indexPath];
  }
  return retVal;
}

-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger section = 0; section < [self.dataSource numberOfSectionsInTableView:self]; section++)
    [retVal addObjectsFromArray:[self indexPathsWithAccessoryType:type inSection:section]];
  return retVal;
}

-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger row = 0; row < [self.dataSource tableView:self numberOfRowsInSection:section]; row++)
  {
    UITableViewCell *cell = [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    if (cell.accessoryType == type)
      [retVal addObject:cell];
  }
  return retVal;
}

-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type {
  NSMutableArray *retVal = [NSMutableArray new];
  for (NSUInteger section = 0; section < [self.dataSource numberOfSectionsInTableView:self]; section++)
    [retVal addObjectsFromArray:[self cellsWithAccessoryType:type inSection:section]];
  return retVal;
}

-(CGFloat) heightForSection:(NSInteger)section {

  CGFloat retVal = [self.delegate tableView:self heightForHeaderInSection:section] + [self.delegate tableView:self heightForFooterInSection:section];
  for (NSUInteger row = 0; row < [self.dataSource tableView:self numberOfRowsInSection:section]; row++)
    retVal += [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
  return retVal;
}

-(NSInteger) numberOfRows {
  NSInteger n = 0;
  for (NSInteger section = 0; section < [self numberOfSections]; section++) {
    n += [self numberOfRowsInSection:section];
  }
  return n;
}

-(void) reloadVisibleIndexPaths {
  [self reloadRowsAtIndexPaths:self.indexPathsForVisibleRows withRowAnimation:UITableViewRowAnimationAutomatic];
}

OPAssociatedObject(tableHeaderViews, setTableHeaderViews, OBJC_ASSOCIATION_RETAIN, nil, ^(NSArray *headers){

  // early out when there are no headers
  if ([headers count] == 0) {
    self.tableHeaderView = nil;
    return ;
  }

  UIView *mainHeader = [UIView new];
  CGFloat top = 0.0f;

  mainHeader.width = [(UIView*)[headers firstObject] width];
  for (UIView *header in headers) {
    mainHeader.height += header.height;
    header.top = top;
    header.autoresizingMask |= UIViewAutoresizingFlexibleWidth;
    top += header.height;
    [mainHeader addSubview:header];
  }

  self.tableHeaderView = mainHeader;

});

-(void) registerClassForDefaultCellReuseIdentifier:(Class)cellClass {
  if ([self respondsToSelector:@selector(registerClass:forCellReuseIdentifier:)]) {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
  }
}

-(void) registerClassForDefaultHeaderFooterViewReuseIdentifier:(Class)aClass {
  if ([self respondsToSelector:@selector(registerClass:forHeaderFooterViewReuseIdentifier:)]) {
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(aClass)];
  }
}

@end
