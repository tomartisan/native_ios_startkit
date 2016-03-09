//
//  FSNavigationController.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSNavigationController.h"
#import "FSBaseViewController.h"

@interface FSNavigationController () <UINavigationControllerDelegate>

@property(nonatomic, assign) BOOL shouldIgnoreStackRequests;
@property(nonatomic, strong) NSMutableArray *waitingCommands;

@end

@implementation FSNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor orangeColor];
    NSDictionary* textAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                     NSFontAttributeName:[UIFont systemFontOfSize:16]};
    [bar setTitleTextAttributes:textAttributes];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIBarButtonItem appearance] setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        self.waitingCommands = [NSMutableArray new];
    }
    return self;
}

- (void)pushViewController:(FSBaseViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if ([FSDeviceTools afterIOS7]) {
        [super pushViewController:viewController animated:animated];
    } else {
        if (!self.shouldIgnoreStackRequests) {
            [super pushViewController:viewController animated:animated];
            
            self.shouldIgnoreStackRequests = YES;
        } else {
            __weak typeof(self) weakSelf = self;
            
            // store and push it after current transition ends
            [self.waitingCommands addObject:^{
                
                id strongSelf = weakSelf;
                
                [strongSelf pushViewController:viewController animated:animated];
                
            }];
        }
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if ([FSDeviceTools afterIOS7]) {
        return [super popViewControllerAnimated:animated];
    } else {
        __block UIViewController *popedController = nil;
        
        if (1 < self.viewControllers.count) {
            if (!self.shouldIgnoreStackRequests) {
                popedController = [super popViewControllerAnimated:animated];
                
                self.shouldIgnoreStackRequests = YES;
            } else {
                __weak typeof(self) weakSelf = self;
                
                [self.waitingCommands addObject:^{
                    
                    id strongSelf = weakSelf;
                    
                    popedController = [strongSelf popViewControllerAnimated:animated];
                    
                }];
            }
        }
        
        return popedController;
    }
}

- (void)dealloc {
    self.delegate = nil;
}

#pragma mark - UINavigationController delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (![FSDeviceTools afterIOS7]) {
        [[self transitionCoordinator] notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            if ([context isCancelled]) {
                self.shouldIgnoreStackRequests = NO;
            }
        }];
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (![FSDeviceTools afterIOS7]) {
        self.shouldIgnoreStackRequests = NO;
        if (0 < self.waitingCommands.count) {
            void (^waitingAction)() = self.waitingCommands.lastObject;
            [self.waitingCommands removeLastObject];
            waitingAction();
        }
    }
}

@end
