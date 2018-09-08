//
//  FSMarkDownView.m
//  FastApp
//
//  Created by tangkunyin on 2018/9/8.
//  Copyright © 2018年 www.shuoit.net. All rights reserved.
//

#import "FSMarkDownView.h"
#import <JavaScriptCore/JavaScriptCore.h>


@interface FSMarkDownView() <WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, nonnull, copy, readwrite) NSString *htmlString;

@property (nonnull, strong) JSContext *jsContext;

@end

@implementation FSMarkDownView

- (instancetype)initWithFrame:(CGRect)react
{
    self = [super initWithFrame:react];
    if (self) {
        self.UIDelegate = self;
        self.navigationDelegate = self;
        self.jsContext = [[JSContext alloc] init];
        [self initialJSContext];
    }
    return self;
}

- (void)initialJSContext
{
    static NSString *js;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [FSPathTools pathForKey:@"showdown.min.js" type:FSBundlePathType];
        js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    });
    [self.jsContext setExceptionHandler:^(JSContext *context, JSValue *exception){
        NSLog(@"%@", exception.toString);
    }];
    // 加载js
    [self.jsContext evaluateScript:js];
    
    // 注入function markdown -> html，使用时可以通过 convert('xxx'); 调用
    NSString *jsFunction = @"\
                            function convert(md) { \
                                return (new showdown.Converter()).makeHtml(md);\
                            }";
    [self.jsContext evaluateScript:jsFunction];
}

#pragma mark - setters
- (void)setContent:(NSString *)content
{
    _content = content;
    if (![FSStringTools isEmpty:_content]) {
        
        JSValue *jsFunctionValue = self.jsContext[@"convert"];
        JSValue *htmlValue = [jsFunctionValue callWithArguments:@[_content]];
        
        // 加载css
        static NSString *css;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSString *path = [FSPathTools pathForKey:@"markdown.css" type:FSBundlePathType];
            css = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        });
        
        self.htmlString = [NSString stringWithFormat:@"\
                                <html>\
                                <head>\
                                <title>%@</title>\
                                <style>%@</style>\
                                </head>\
                                <body>\
                                %@\
                                </body>\
                                </html>\
                                ", content, css, htmlValue.toString];
        [self loadHTMLString:self.htmlString baseURL:nil];
    } else {
        NSLog(@"Invalid content error {markdown content can't be null %@}", _content);
    }
}

- (void)setContentUrl:(NSString *)contentUrl
{
    self.contentUrl = contentUrl;
    self.content = [NSString stringWithContentsOfURL:[NSURL URLWithString:self.contentUrl] encoding:NSUTF8StringEncoding error:nil];
}

#pragma mark - delegates
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"MarkDown --- 开始加载");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"MarkDown --- 加载完成");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSString *localErrorDes = [error.userInfo valueForKey:NSLocalizedDescriptionKey];
    NSString *errorMsg = (nil == localErrorDes) ? @"MarkDown加载出错" : localErrorDes;
    [MBProgressHUD showError:errorMsg];
}

@end
