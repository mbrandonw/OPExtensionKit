//
//  NSPredicate+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 9/22/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSPredicate+Opetopic.h"

@implementation NSPredicate (Opetopic)

+(NSPredicate*) predicateForSearching:(NSString*)text fields:(NSArray*)fields {
    
    NSArray *searchParts = [text componentsSeparatedByString:@" "];
    
    NSMutableString *format = [NSMutableString string];
    NSMutableArray *arguments = [NSMutableArray arrayWithCapacity:[searchParts count] * [fields count]];
    
    for (NSString *part in searchParts)
    {
        if ([part length])
        {
            [format appendFormat:@"("];
            {
                for (NSString *field in fields) {
                    [format appendFormat:@"%@ contains[cd] %%@ %@", field, field!=[fields lastObject] ? @" OR " : @" "];
                    [arguments addObject:part];
                }
            }
            [format appendFormat:@") AND "];
        }
    }
    
    if ([arguments count] == 0)
        return [NSPredicate predicateWithFormat:@"1==1"];
    
    return [NSPredicate predicateWithFormat:[format stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"AND"]]
                              argumentArray:arguments];
}

-(NSPredicate*) and:(NSPredicate*)predicate {
    return [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:self, predicate, nil]];
}

-(NSPredicate*) or:(NSPredicate*)predicate {
    return [NSCompoundPredicate orPredicateWithSubpredicates:[NSArray arrayWithObjects:self, predicate, nil]];
}

@end
