//
//  YLPlayer.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/18.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@implementation YLPlayer

// 1, AVPlayer

// 2, MPMoviePlayerController

// 3, AVPlayerViewController

- (void)run {
    
    // 1
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:nil];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectZero;
    
    [player play];
    [player pause];
    
    // 2
    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:nil];
    [moviePlayer prepareToPlay];
    [moviePlayer play];
    
    // 3
    // same to 1
    
}

@end
