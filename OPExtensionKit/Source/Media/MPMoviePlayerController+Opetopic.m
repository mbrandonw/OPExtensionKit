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
  if (self.duration > 0.0) {
    return self.currentPlaybackTime / self.duration;
  }
  return 0.0;
}

-(BOOL) isStopped {
  return self.playbackState == MPMoviePlaybackStateStopped;
}

-(BOOL) isPlaying {
  return self.playbackState == MPMoviePlaybackStatePlaying;
}

-(BOOL) isPaused {
  return self.playbackState == MPMoviePlaybackStatePaused;
}

-(BOOL) isInterrupted {
  return self.playbackState == MPMoviePlaybackStateInterrupted;
}

-(BOOL) isSeekingForward {
  return self.playbackState == MPMoviePlaybackStateSeekingForward;
}

-(BOOL) isSeekingBackward {
  return self.playbackState == MPMoviePlaybackStateSeekingBackward;
}

@end
