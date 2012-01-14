//
//  NSPredicate+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 9/22/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSPredicate+Opetopic.h"

@implementation NSPredicate (Opetopic)

+(NSPredicate*) predicateForSearching:(NSString*)text fields:(NSArray*)fields {
    
    NSPredicate *predicate = nil;
    
    NSArray *searchParts = [text componentsSeparatedByString:@" "];
    for (NSString *part in searchParts)
    {
        if ([part length])
        {
            NSPredicate *subPredicate = nil;
            for (NSString *field in fields) {
                if (subPredicate)
                    subPredicate = [subPredicate or:[NSPredicate predicateWithFormat:@"%K contains[cd] %@", field, part]];
                else
                    subPredicate = [NSPredicate predicateWithFormat:@"%K contains[cd] %@", field, part];
            }
            
            predicate = predicate ? [predicate and:subPredicate] : subPredicate;
        }
    }
    
    return predicate;
}

-(NSPredicate*) and:(NSPredicate*)predicate {
    return [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:self, predicate, nil]];
}

-(NSPredicate*) or:(NSPredicate*)predicate {
    return [NSCompoundPredicate orPredicateWithSubpredicates:[NSArray arrayWithObjects:self, predicate, nil]];
}

@end
