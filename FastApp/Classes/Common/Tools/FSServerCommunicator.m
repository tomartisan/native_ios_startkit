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
        [self.manager GET:url parameters:nil headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
        [self.manager POST:url parameters:param headers:nil progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
        [self.manager POST:url parameters:param headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:fileData name:fileName fileName:fileName mimeType:mimeType];
        } progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self handleResponse:responseObject Resp:nil completion:completion];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [MBProgressHUD handleErrorWithCode:error.code additional:task.response];
        } ];
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
    FSLog(@"Get Request with url: %@", mUrl);
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
    FSLog(@"Post Request url is: %@ and params is: %@",url,param);
    if (url) {
        if (sign) {
            //自定义加密规则...
            
            
        }
        [self doPostWithUrl:url param:param respObj:obj progress:progress completion:completion];
    }
}

#pragma mark - response handler（统一错误处理，统一返回值处理）
- (void)handleResponse:(id)responseObject
                  Resp:(Class)ObjType
            completion:(void (^)(BOOL success,id respData))completion;
{
    @try {
        
        id resultData = [responseObject mj_JSONObject];
        FSBaseResponse *response = [FSBaseResponse mj_objectWithKeyValues:resultData];
        
        //对于不需要返回数据的操作
        if ([FSStringTools isEmpty:response.data] && HttpStatusSuccessCode == response.code) {
            completion(YES ,response.msg);
            return;
        }
        
        if(![FSStringTools isEmpty:response.data]){
            
            id jsonObject = [response.data mj_JSONObject];
            
            if (HttpStatusSuccessCode == response.code) {
                
                if (nil == ObjType) {
                    resultData = jsonObject;
                }else if ([jsonObject isKindOfClass:[NSDictionary class]]){
                    resultData = [ObjType mj_objectWithKeyValues:jsonObject];
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
                    resultData = [ObjType mj_objectArrayWithKeyValuesArray:jsonObject];
                }
                
            } else {
                [MBProgressHUD handleErrorWithCode:response.code additional:response.msg];
            }
        } else {
            [MBProgressHUD handleErrorWithCode:HttpStatusReturnNullCode additional:nil];
        }
        completion((nil == resultData) ? NO : YES ,resultData);
    }@catch(NSException *excep){
        FSLog(@"数据解析异常: %@",excep.reason);
        completion(NO,nil);
        [MBProgressHUD showError:@"数据解析异常"];
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
