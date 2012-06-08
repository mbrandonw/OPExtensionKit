//
//  UITableView+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 5/24/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <UIKit/UIKit.h>

UITableViewRowAnimation UITableViewRowAnimationAutomaticOr(UITableViewRowAnimation rowAnimation);

@interface UITableView (Opetopic)

-(NSArray*) indexPathsInSection:(NSUInteger)section;
-(NSArray*) allIndexPaths;
-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section;
-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type;
-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section;
-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type;

@end
