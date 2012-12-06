//
//  MPMoviePlayerController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "MPMoviePlayerController+Opetopic.h"

@implementation MPMoviePlayerController (Opetopic)

-(NSTimeInterval) completionPercentage {
    return self.currentPlaybackTime / self.playableDuration;
}

@end
