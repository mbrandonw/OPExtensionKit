//
//  NSMutableArray+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 5/28/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSMutableArray+Opetopic.h"


@implementation NSMutableArray (Opetopic)

-(void) shuffle {
	
	for (NSUInteger i = 0; i < [self count]; i++)
		[self exchangeObjectAtIndex:i withObjectAtIndex:arc4random()%[self count]];
}

-(id) pop {
	
	id retVal = [self lastObject];
	if ([self count])
		[self removeLastObject];
	return retVal;
}

@end
