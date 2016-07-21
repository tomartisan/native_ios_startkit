//
//  FSBaseSubViewController.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSBaseViewController.h"

//支持使用手势返回，即:右滑动也可以返回上层
@interface FSBaseSubViewController : FSBaseViewController


/**
 *  需要返回根视图时，请重写此方法
 */
-(void)backToParentController;

@end
