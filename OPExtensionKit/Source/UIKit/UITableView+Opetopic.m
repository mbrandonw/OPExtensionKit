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
