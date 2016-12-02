//
//  FSServerCommunicator.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSServerCommunicator : NSObject

//通用(GET|POST)
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
                    param:(NSDictionary *)param
                 mimeType:(NSString *)mimeType
                 progress:(void (^)(NSProgress *progress))progress
               completion:(void (^)(BOOL success,id respData))completion;

//支持进度与断点续传的文件下载（当data不为空时，即为断点下载）
- (void)downloadWithUrl:(NSString *)url
             resumeData:(NSData *)data
               progress:(void (^)(NSProgress *downloadProgress))downloadProgress
            destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
      completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;


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
