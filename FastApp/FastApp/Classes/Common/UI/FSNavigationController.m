//
//  FSNavigationController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSNavigationController.h"

@implementation FSNavigationController

+ (void)initialize
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = FSWhiteColor;
    bar.titleTextAttributes = @{NSFontAttributeName:SysFontWithSize(16)};
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
