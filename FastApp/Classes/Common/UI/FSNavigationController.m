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
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = FSCoffeeColor;
    NSDictionary* textAttributes = @{NSForegroundColorAttributeName:FSWhiteColor,NSFontAttributeName:SysFontWithSize(16)};
    [bar setTitleTextAttributes:textAttributes];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIBarButtonItem appearance] setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
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
