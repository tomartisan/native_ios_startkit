//
//  FSBaseResponse.h
//  FastApp
//
//  Created by tangkunyin on 16/6/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

//服务器返回的通用数据结构，可根据实际情况做调整
@interface FSBaseResponse : NSObject

//服务器返回的状态码
@property (nonatomic, assign) int code;

//服务器返回的错误信息
@property (nonatomic, copy) NSString *msg;

//服务器返回的数据
@property (nonatomic, copy) NSString *data;

@end
