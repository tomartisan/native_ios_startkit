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
#import <MediaPlayer/MediaPlayer.h>

#define filePath @"/Users/tangkunyin/Desktop/hello.swf"

typedef NS_ENUM(NSInteger,BtnType)
{
    DownloadBtnType,
    PlayerBtnType
};

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
    [serverReq doGetWithUrl:@"http://goodidea-big.qiniudn.com/screenclean.swf"
                     respObj:nil
                    progress:^(NSProgress *progress) {
                        NSString *completed = [NSString stringWithFormat:@"%.0f%%",progress.fractionCompleted * 100];
                        [MBProgressHUD showProgress:progress.fractionCompleted
                                            message:completed
                                               mode:MBProgressHUDModeAnnularDeterminate];
                 }completion:^(BOOL success, id respData) {
                     if (success) {
                         [[NSData dataWithData:respData] writeToFile:filePath atomically:YES];
                         [MBProgressHUD showMessage:@"下载完成" completion:^{
                             [weakSelf.btn setTitle:@"开始播放" forState:UIControlStateNormal];
                             [weakSelf.btn setBackgroundColor:FSBlueColor];
                             weakSelf.btn.tag = PlayerBtnType;
                         }];
                     }
    }];
}

- (void)playVideo
{
    NSURL *url = [NSURL URLWithString:filePath];
    MPMoviePlayerController *movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    movie.controlStyle = MPMovieControlStyleFullscreen;
    movie.view.frame = self.view.bounds;
    movie.initialPlaybackTime = -1;
    
    [self.view addSubview:movie.view];
    
    // 注册一个播放结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:movie];
    [movie play];

}

-(void)myMovieFinishedCallback:(NSNotification*)notify
{
    //视频播放对象
    MPMoviePlayerController* theMovie = [notify object];
    //销毁播放通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    [theMovie.view removeFromSuperview];
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
        _btn  = [UICreator createButtonWithTitle:@"开始下载"
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
