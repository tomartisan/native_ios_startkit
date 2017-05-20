//
//  FSAppHomeViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSAppHomeViewController.h"
#import "FSNavigationController.h"
#import "FSIndexViewController.h"
#import "FSUIDemoViewController.h"
#import "FSOtherViewController.h"
#import "FSShopingViewController.h"
#import "FSUserViewController.h"
#import "MBProgressHUD+Show.h"


@implementation FSAppHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self addAllChildViewControllers];
}


- (void)addAllChildViewControllers
{
    //首页说明
    FSIndexViewController *indexVC = [[FSIndexViewController alloc] init];
    [self addChildViewController:indexVC title:@"首页" image:@"11" selectedImage:@"12"];
    
    //界面使用
    FSUIDemoViewController *uiVC = [[FSUIDemoViewController alloc] init];
    [self addChildViewController:uiVC title:@"界面" image:@"21" selectedImage:@"22"];
    
    //其他工具使用
    FSOtherViewController *othersVC = [[FSOtherViewController alloc] init];
    [self addChildViewController:othersVC title:@"其他" image:@"31" selectedImage:@"32"];
    
    //购物模块
    FSShopingViewController *shopVC = [[FSShopingViewController alloc] init];
    [self addChildViewController:shopVC title:@"购物" image:@"41" selectedImage:@"42"];
    
    //用户模块
    FSUserViewController *hisVc = [[FSUserViewController alloc] init];
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

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [MBProgressHUD showMessage:[NSString stringWithFormat:@"这是：%@ 演示",viewController.title] completion:^{
        NSLog(@"你刚刚点了：%@",viewController.title);
    }];
}

@end
