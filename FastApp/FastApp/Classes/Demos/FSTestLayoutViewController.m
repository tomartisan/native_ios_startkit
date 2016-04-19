//
//  FSTestLayoutViewController.m
//  FastApp
//
//  Created by tangkunyin on 16/4/6.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSTestLayoutViewController.h"


@implementation FSTestLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    switch (self.type) {
        case FSTestLayoutType11:
        {
            UIView *testView = [FSUICreator createViewWithSize:CGSizeMake(80, 80) bgColor:RandomColorWithAlpha(1) radius:0];
            [FSAutolayoutor layView:testView fullOfTheView:self.view];
        }
            break;
            
        default:
            break;
    }
    
}


@end
