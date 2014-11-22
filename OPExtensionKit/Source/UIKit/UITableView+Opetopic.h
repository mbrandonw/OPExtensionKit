//
//  UITableView+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 5/24/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Opetopic)

-(NSArray*) indexPathsInSection:(NSUInteger)section;
-(NSArray*) allIndexPaths;
-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section;
-(NSArray*) indexPathsWithAccessoryType:(UITableViewCellAccessoryType)type;
-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type inSection:(NSUInteger)section;
-(NSArray*) cellsWithAccessoryType:(UITableViewCellAccessoryType)type;

-(CGFloat) heightForSection:(NSInteger)section;

-(NSInteger) numberOfRows;

-(void) reloadVisibleIndexPaths;

-(void) setTableHeaderViews:(NSArray*)views;
-(NSArray*) tableHeaderViews;

-(void) registerClassForDefaultCellReuseIdentifier:(Class)cellClass;
-(void) registerClassForDefaultHeaderFooterViewReuseIdentifier:(Class)aClass;

@end
