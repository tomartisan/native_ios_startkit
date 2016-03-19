//
//  FSServerCommunicator.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSServerCommunicator : NSObject

//通用(GET|POST),GET可用于下载
- (void)doGetWithUrl:(NSString *)url
             respObj:(Class)obj
            progress:(void (^)(NSProgress *progress))progress
          completion:(void (^)(BOOL success,id respData))completion;

- (void)doPostWithUrl:(NSString *)url
                param:(NSDictionary *)param
              respObj:(Class)obj
             progress:(void (^)(NSProgress *progress))progress
           completion:(void (^)(BOOL success,id respData))completion;

//文件上传请求
- (void)uploadFileWithUrl:(NSString *)url
                     file:(NSData *)fileData
                     name:(NSString *)fileName
                 mimeType:(NSString *)mimeType
                 progress:(void (^)(NSProgress *progress))progress
               completion:(void (^)(BOOL success,id respData))completion;


//包含参数加密的请求(跟业务直接相关)
- (void)doGetWithUri:(NSString *)uri
               param:(id)param
             respObj:(Class)obj
             useSign:(BOOL)sign
            progress:(void (^)(NSProgress *progress))progress
          completion:(void (^)(BOOL success,id respData))completion;

- (void)doPostWithUri:(NSString *)uri
                param:(id)param
              respObj:(Class)obj
              useSign:(BOOL)sign
             progress:(void (^)(NSProgress *progress))progress
           completion:(void (^)(BOOL success,id respData))completion;

@end
