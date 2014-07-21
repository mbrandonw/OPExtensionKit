//
//  MPMoviePlayerController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface MPMoviePlayerController (Opetopic)

-(CGFloat) completionPercentage;

-(BOOL) isStopped;
-(BOOL) isPlaying;
-(BOOL) isPaused;
-(BOOL) isInterrupted;
-(BOOL) isSeekingForward;
-(BOOL) isSeekingBackward;

@end
