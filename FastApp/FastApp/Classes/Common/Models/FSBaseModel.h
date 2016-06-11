//
//  FSBaseModel.h
//  FastApp
//
//  Created by tangkunyin on 16/6/11.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

//模型基类，对于OC保留字进行替换（如果服务器返回的字段发生冲突时）
@interface FSBaseModel : NSObject

@property (nonatomic, assign) int ID;
@property (nonatomic, copy) NSString *desc;

@end
