//
//  FSServerCommunicator.m
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import "FSServerCommunicator.h"
#import "AFNetworking.h"

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

- (void)doGetWithUri:(NSString *)uri
               param:(id)param
             respObj:(Class)obj
             useSign:(BOOL)sign
            progress:(void (^)(NSProgress *progress))progress
          completion:(void (^)(BOOL success,id respData))completion
{
    NSString *url = [self urlWithUri:uri params:param];
    if (url) {
        if (sign) {
            //加密规则...
            
        }
        [self doGetWithUrl:url respObj:obj progress:progress completion:completion];
    }
}

- (void)doPostWithUri:(NSString *)uri
                param:(id)param
              respObj:(Class)obj
              useSign:(BOOL)sign
             progress:(void (^)(NSProgress *progress))progress
           completion:(void (^)(BOOL success,id respData))completion
{
    NSString *url = [self urlWithUri:uri params:param];
    if (url) {
        if (sign) {
            //加密规则...
            
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
        if([responseObject isKindOfClass:[NSData class]]){
            NSString *originString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            if (originString && [NSJSONSerialization isValidJSONObject:originString]) {
                responseObject = [NSJSONSerialization JSONObjectWithData:[originString dataUsingEncoding:NSUTF8StringEncoding]
                                                             options:NSJSONReadingMutableLeaves
                                                               error:nil];
            }
            if (![StringTools isEmpty:originString]) {
                responseObject = originString;
            }
        }
        if (responseObject) {
            id data = (nil == ObjType) ? responseObject : [ObjType mj_objectWithKeyValues:responseObject];
            completion((nil == data) ? NO : YES,data);
            return;
        }
        [MBProgressHUD handleErrorWithCode:HttpStatusReturnNullCode additional:nil];
    }@catch(NSException *excep){
        [MBProgressHUD showError:@"数据解析异常"];
        log(excep.reason)
    }
}

- (NSString *)urlWithUri:(NSString *)uri params:(id)params
{
    NSString *urlPrefix = [GlobalCache sharedInstance].appServerUrl;
    NSString *url = [NSString stringWithFormat:@"%@%@",urlPrefix,uri];
    
    NSMutableString *mUrl = [NSMutableString stringWithString:url];
    if ([params isKindOfClass:[NSString class]]) {
        [mUrl appendString:params];
    }
    if ([params isKindOfClass:[NSDictionary class]]) {
        [mUrl appendString:[StringTools paramStringFromDict:params]];
    }
    log(mUrl)
    
    return mUrl;
}

#pragma mark - getter
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.requestSerializer.timeoutInterval = SERVER_CONNECT_TIMEOUT;
    }
    return _manager;
}


@end
