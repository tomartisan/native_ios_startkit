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

@interface FSPersonCenterViewController ()
@property (nonatomic, strong) UIButton *loadDataBtn;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation FSPersonCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"说IT"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(webViewControllerTest)];

    
    
    [PositionTools layView:self.textView atCenterOfView:self.view maxSize:CGSizeMake(300, 200) margins:0];
    [PositionTools layView:self.loadDataBtn outsideView:self.textView type:MiddleBottom maxSize:CGSizeMake(120, 60) offset:CGSizeMake(0, 30)];
}

//服务器请求演示，带进度的
- (void)loadDataTest
{
    NSString *filePath = [CacheTools getFilePathByName:@"testData" subffix:@"txt"];
    NSString *StringData = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *params = @{@"operatorId":@"84",@"dataCode":StringData,@"type":@(1)};
    
    FSServerCommunicator *serverReq = [[FSServerCommunicator alloc] init];
    __weak typeof(self) weakSelf = self;
    [serverReq doPostWithUrl:@"http://192.168.1.250:8090/APIService/common/upload/photo"
                       param:params
                     respObj:nil
                    progress:^(NSProgress *progress) {
//                        [MBProgressHUD showProgress:progress.fractionCompleted];
                        NSLog(@"已完成：%f",progress.fractionCompleted);
                 }completion:^(BOOL success, id respData) {
                     if (success) {
                         weakSelf.textView.text = [NSString stringWithFormat:@"服务器返回；%@",respData];
                     }
    }];
}

- (void)webViewControllerTest
{
    FSWebViewController *webVC = [[FSWebViewController alloc] initWithTitle:@"关注技术和人文的原创IT博客" webUrl:API_SERVER_URL];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - getters
- (UIButton *)loadDataBtn
{
    if (!_loadDataBtn) {
        _loadDataBtn  = [UICreator createButtonWithTitle:@"数据提交测试"
                                              titleColor:FSWhiteColor
                                                    font:SysFontWithSize(14)
                                                  target:self
                                                  action:@selector(loadDataTest)];
        _loadDataBtn.backgroundColor = FSOrangeColor;
        _loadDataBtn.layer.cornerRadius = 5;
    }
    return _loadDataBtn;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UICreator createTextViewWithAttrString:nil editEnable:NO scroolEnable:YES];
        _textView.backgroundColor = FSlightGrayColor;
    }
    return _textView;
}

@end
