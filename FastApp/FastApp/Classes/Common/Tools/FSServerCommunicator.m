//
//  FSServerCommunicator.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSServerCommunicator.h"
#import "AFNetworking.h"
#import "FSBaseResponse.h"

@interface FSServerCommunicator ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation FSServerCommunicator

- (void)doGetWithUrl:(NSString *)url
             respObj:(Class)obj
            progress:(void (^)(NSProgress *progress))progress
          completion:(void (^)(BOOL success,id respData))completion
{
    if (url) {
        [self.manager GET:url parameters:nil progress:progress
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                      [self handleResponse:responseObject Resp:obj completion:completion];
                  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                      [MBProgressHUD handleErrorWithCode:error.code additional:task.response];
                  }];
    }
}

- (void)doPostWithUrl:(NSString *)url
                param:(NSDictionary *)param
              respObj:(Class)obj
             progress:(void (^)(NSProgress *progress))progress
           completion:(void (^)(BOOL success,id respData))completion
{
    if (url) {
        [self.manager POST:url parameters:param progress:progress
                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                       [self handleResponse:responseObject Resp:obj completion:completion];
                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                       [MBProgressHUD handleErrorWithCode:error.code additional:task.response];
                   }];
    }
}

- (void)uploadFileWithUrl:(NSString *)url
                     file:(NSData *)fileData
                     name:(NSString *)fileName
                    param:(NSDictionary *)param
                 mimeType:(NSString *)mimeType
                 progress:(void (^)(NSProgress *progress))progress
               completion:(void (^)(BOOL success,id respData))completion
{
    if (url) {
        [self.manager POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:fileData name:fileName fileName:fileName mimeType:mimeType];
        } progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handleResponse:responseObject Resp:nil completion:completion];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD handleErrorWithCode:error.code additional:task.response];
        }];
    }
}

- (void)downloadWithUrl:(NSString *)url
             resumeData:(NSData *)data
               progress:(void (^)(NSProgress *downloadProgress))downloadProgress
            destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
      completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler
{
    if (![FSStringTools isEmpty:url]) {
        NSURLRequest *req = [FSNetTools getRequestWithURLString:url method:@"GET" timeOut:FS_Timeout];
        [self.manager downloadTaskWithRequest:req progress:downloadProgress destination:destination completionHandler:completionHandler];
    }
    if (data) {
        [self.manager downloadTaskWithResumeData:data progress:downloadProgress destination:destination completionHandler:completionHandler];
    }
}

- (void)doGetWithUri:(NSString *)uri
               param:(id)param
             respObj:(Class)obj
             useSign:(BOOL)sign
            progress:(void (^)(NSProgress *progress))progress
          completion:(void (^)(BOOL success,id respData))completion
{
    NSString *url = [NSString stringWithFormat:@"%@%@",[GlobalCache sharedInstance].appServerUrl,uri];
    NSMutableString *mUrl = [NSMutableString stringWithString:url];
    if ([param isKindOfClass:[NSString class]]) {
        [mUrl appendString:param];
    }
    if ([param isKindOfClass:[NSDictionary class]]) {
        [mUrl appendString:[FSStringTools paramStringFromDict:param]];
    }
    NSString *logMsg = [NSString stringWithFormat:@"Get Request with url: %@",mUrl];
    log(logMsg);
    if (mUrl) {
        if (sign) {
            //自定义加密规则...
            
            
        }
        [self doGetWithUrl:mUrl respObj:obj progress:progress completion:completion];
    }
}

- (void)doPostWithUri:(NSString *)uri
                param:(id)param
              respObj:(Class)obj
              useSign:(BOOL)sign
             progress:(void (^)(NSProgress *progress))progress
           completion:(void (^)(BOOL success,id respData))completion
{
    NSString *url = [NSString stringWithFormat:@"%@%@",[GlobalCache sharedInstance].appServerUrl,uri];
    NSString *logMsg = [NSString stringWithFormat:@"Post Request url is: %@ and params is: %@",url,param];
    log(logMsg);
    if (url) {
        if (sign) {
            //自定义加密规则...
            
            
        }
        [self doPostWithUrl:url param:param respObj:obj progress:progress completion:completion];
    }
}

#pragma mark - response handler
- (void)handleResponse:(id)responseObject
                  Resp:(Class)ObjType
            completion:(void (^)(BOOL success,id respData))completion;
{
    @try{
        if(responseObject && [responseObject isKindOfClass:[NSData class]]){
            
            FSBaseResponse *response = [FSBaseResponse mj_objectWithKeyValues:[responseObject mj_JSONObject]];
            
            if (HttpStatusSuccessCode == response.code) {
                
                id finalData = nil;
                id jsonObject = [response.data mj_JSONObject];
                
                if (nil == ObjType) {
                    finalData = jsonObject;
                }else if ([jsonObject isKindOfClass:[NSDictionary class]]){
                    finalData = [ObjType mj_objectWithKeyValues:jsonObject];
                }else if ([jsonObject isKindOfClass:[NSArray class]]){
                    /**
                     *  特别提示：此处ObjType模型中有个数组属性，数组里面又要装着其他模型时，需要在ObjType的m文件中实现+mj_objectClassInArray
                     *
                     *   + (NSDictionary *)mj_objectClassInArray
                     *   {
                     *      return @{@"arrayPropertyName":[Model class]};
                     *   }
                     *
                     */
                    finalData = [ObjType mj_objectArrayWithKeyValuesArray:jsonObject];
                }
                
                completion((nil == finalData) ? NO : YES ,finalData);
                
            }else{
                [MBProgressHUD handleErrorWithCode:response.code additional:response.msg];
            }
            return;
        }
        [MBProgressHUD handleErrorWithCode:HttpStatusReturnNullCode additional:nil];
    }@catch(NSException *excep){
        [MBProgressHUD showError:@"数据解析异常"];
        log(excep.reason)
    }
}

#pragma mark - getter
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.requestSerializer.timeoutInterval = FS_Timeout;
    }
    return _manager;
}


@end
