//
//  FSTestDownLoadViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/4.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestDownLoadViewController.h"
#import "FSServerCommunicator.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


static NSString *const fileName = @"mp4ForDownloadTest.mp4";
static NSString *const stringUrl = @"http://7xseox.com1.z0.glb.clouddn.com/mp4ForDownloadTest.mp4";

@interface FSTestDownLoadViewController ()
@property (nonatomic, strong) UIButton *downBtn;
@property (nonatomic, strong) UIButton *playBtn;
@end

@implementation FSTestDownLoadViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [FSAutolayoutor layView:self.downBtn insideView:self.view type:LeftBottom maxSize:CGSizeMake(60, 45) offset:CGSizeMake(20, 0)];
    [FSAutolayoutor layView:self.playBtn insideView:self.view type:RightBottom maxSize:CGSizeMake(60, 45) offset:CGSizeMake(20, 0)];
    
    if ([FSPathTools exists:[FSPathTools pathForKey:fileName type:FSTmpPathType] autoCreate:NO]) {
        
    }
}

- (void)playVideo
{
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    //    NSURL *url = [NSURL fileURLWithPath:[FSPathTools pathForKey:fileName type:FSTmpPathType] isDirectory:NO];
    
    
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    
    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:url options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    
    playerVC.player = player;
    
    [self presentViewController:playerVC animated:YES completion:^{
        [player play];
    }];
    
}

#pragma mark - getters
- (UIButton *)downBtn
{
    if (!_downBtn) {
        _downBtn  = [FSUICreator createButtonWithTitle:@"下 载"
                                          titleColor:FSWhiteColor
                                                font:SysFontWithSize(14)
                                              target:self
                                              action:@selector(downAction)];
        _downBtn.backgroundColor = FSOrangeColor;
        _downBtn.layer.cornerRadius = 5;
    }
    return _downBtn;
}

- (UIButton *)playBtn
{
    if (!_playBtn) {
        _playBtn  = [FSUICreator createButtonWithTitle:@"播 放"
                                          titleColor:FSWhiteColor
                                                font:SysFontWithSize(14)
                                              target:self
                                              action:@selector(playAction)];
        _playBtn.backgroundColor = FSBlueColor;
        _playBtn.layer.cornerRadius = 5;
    }
    return _playBtn;
}

@end
