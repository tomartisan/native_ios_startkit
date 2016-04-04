//
//  FSHomeViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSHomeViewController.h"
#import "FSNavigationController.h"
#import "FSPersonCenterViewController.h"
#import "FSHeHeViewController.h"

@implementation FSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildViewControllers];
}


- (void)addAllChildViewControllers
{
    //首页
    FSPersonCenterViewController *indexVC = [[FSPersonCenterViewController alloc] init];
    [self addChildViewController:indexVC title:@"首页" image:@"11" selectedImage:@"12"];
    
    //分类
    FSHeHeViewController *mineVC = [[FSHeHeViewController alloc] init];
    mineVC.inView = YES;
    [self addChildViewController:mineVC title:@"界面" image:@"21" selectedImage:@"22"];
    
    //呵呵呵
    FSHeHeViewController *heheVC = [[FSHeHeViewController alloc] init];
    heheVC.inView = NO;
    [self addChildViewController:heheVC title:@"其他" image:@"31" selectedImage:@"32"];
    
    //清单
    FSHeHeViewController *yourVC = [[FSHeHeViewController alloc] init];
    yourVC.inView = YES;
    [self addChildViewController:yourVC title:@"购物" image:@"41" selectedImage:@"42"];
    
    //我的
    FSHeHeViewController *hisVc = [[FSHeHeViewController alloc] init];
    hisVc.inView = NO;
    [self addChildViewController:hisVc title:@"用户" image:@"51" selectedImage:@"52"];
}


- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString *)title
                         image:(NSString *)normalImageName
                 selectedImage:(NSString *)selectedImageName
{
    childController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                               image:[UIImage imageWithNamed:normalImageName]
                                                       selectedImage:[UIImage imageWithNamed:selectedImageName]];
    
    NSDictionary *normalAttr = @{NSForegroundColorAttributeName:FSBlackColor,NSFontAttributeName:PFNFontWithSize(11)};
    NSDictionary *highlightAttr = @{NSForegroundColorAttributeName:FSCoffeeColor,NSFontAttributeName:PFNFontWithSize(11)};
    
    [childController.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:highlightAttr forState:UIControlStateSelected];
    
    childController.title = title;
    FSNavigationController *nav = [[FSNavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

@end
