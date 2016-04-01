//
//  FSPersonCenterViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/8.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSPersonCenterViewController.h"
#import "FSWebViewController.h"
#import "FSServerCommunicator.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger,BtnType)
{
    DownloadBtnType,
    PlayerBtnType
};

static NSString *const fileName = @"mp4ForDownloadTest.mp4";

@interface FSPersonCenterViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation FSPersonCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"说IT"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(webViewControllerTest)];
    
    [PositionTools layView:self.btn insideView:self.view type:MiddleBottom maxSize:CGSizeMake(120, 60) offset:CGSizeMake(0, 80)];
    
    if ([FSPathTools exists:[FSPathTools pathForKey:fileName type:FSTmpPathType] autoCreate:NO]) {
        self.btn.tag = PlayerBtnType;
        [self.btn setTitle:@"播放视频" forState:UIControlStateNormal];
        [self.btn setBackgroundColor:FSBlueColor];
    }
}

- (void)clickAction:(UIButton *)btn
{
    switch (btn.tag) {
        case DownloadBtnType:
            [self loadDataTest];
            break;
        case PlayerBtnType:
            [self playVideo];
            break;
    }
}

//服务器请求演示，带进度的
- (void)loadDataTest
{
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    __weak typeof(self) weakSelf = self;
    [serverReq doGetWithUrl:[NSString stringWithFormat:@"http://7xseox.com1.z0.glb.clouddn.com/%@",fileName]
                     respObj:nil
                    progress:^(NSProgress *progress) {
                        NSString *completed = [NSString stringWithFormat:@"%.0f%%",progress.fractionCompleted * 100];
                        [MBProgressHUD showProgress:progress.fractionCompleted
                                            message:completed
                                               mode:MBProgressHUDModeAnnularDeterminate];
                 }completion:^(BOOL success, id respData) {
                     if (success) {
                         [FSCacheTools cacheTmpData:respData forKey:fileName];
                         [MBProgressHUD showMessage:@"下载完成" completion:^{
                             [weakSelf.btn setTitle:@"播放视频" forState:UIControlStateNormal];
                             [weakSelf.btn setBackgroundColor:FSBlueColor];
                             weakSelf.btn.tag = PlayerBtnType;
                         }];
                     }
    }];
}

- (void)playVideo
{
//    NSURL *url = [NSURL fileURLWithPath:[FSPathTools pathForKey:fileName type:FSTmpPathType] isDirectory:NO];
    
//    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
//    
//    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:url options:nil];
//    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
//    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
//    
//    playerVC.player = player;
//    
//    [self presentViewController:playerVC animated:YES completion:^{
//        [player play];
//    }];
    
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://7xseox.com1.z0.glb.clouddn.com/%@",fileName]];
    
    
    NSURL *url = [NSURL fileURLWithPath:@"/Users/tangkunyin/Desktop/mp4ForDownloadTest.mp4"];
    AVAsset *movieAsset = [AVURLAsset assetWithURL:url];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(0, 0, KDeviceWidth, 300);
    playerLayer.videoGravity=AVLayerVideoGravityResize;
    
    [self.view.layer addSublayer:playerLayer];
    
    [player play];
    
}

- (void)webViewControllerTest
{
    FSWebViewController *webVC = [[FSWebViewController alloc] initWithTitle:@"关注技术和人文的原创IT博客" webUrl:API_SERVER_URL];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - getters
- (UIButton *)btn
{
    if (!_btn) {
        _btn  = [UICreator createButtonWithTitle:@"下载视频"
                                      titleColor:FSWhiteColor
                                            font:SysFontWithSize(14)
                                          target:self
                                          action:@selector(clickAction:)];
        _btn.backgroundColor = FSOrangeColor;
        _btn.layer.cornerRadius = 5;
        _btn.tag = DownloadBtnType;
    }
    return _btn;
}

@end
