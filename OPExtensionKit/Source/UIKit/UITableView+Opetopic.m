//
//  UITableView+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 5/24/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "UITableView+Opetopic.h"

UITableViewRowAnimation UITableViewRowAnimationAutomaticOr(UITableViewRowAnimation rowAnimation) {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
        return UITableViewRowAnimationAutomatic;
    return rowAnimation;
}

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

@end