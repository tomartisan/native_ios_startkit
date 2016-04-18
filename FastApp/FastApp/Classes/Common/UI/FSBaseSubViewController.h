//
//  FSBaseSubViewController.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseViewController.h"

@interface FSBaseSubViewController : FSBaseViewController

//使用手势返回即，右滑动也可以 返回上层。默认开启
@property (nonatomic, assign) BOOL backUseGesture;

//需要返回根视图时，请重写此方法
-(void)backToParentController;

@end
