
//
//  GloabVariables.h
//  FastApp
//
//  Created by tangkunyin on 16/3/7.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  服务器连接超时时间
 */
static double const SERVER_CONNECT_TIMEOUT = 45.0f;

/**
 *  API服务器地址
 */
static NSString *const API_SERVER_URL = @"http://www.shuoit.net";

/**
 *  DES3 KEY (必须是24位)
 */
static NSString *const DES_KEY = @"123456781234567812345678";

/**
 *  MD5 KEY (8位)
 */
static NSString *const MD5_KEY = @"88888888";

/**
 *  分页每页的条数
 */
static int const pageRows = 10;


// HTTP返回码
typedef NS_ENUM(NSInteger,HttpStatusCode)
{
    DataParseErrorCode=-1,               //数据解析错误
    HttpStatusReturnNullCode=0,          //服务返回为空
    
    HttpStatusSuccessCode=200,           //请求成功
    HttpStatusNotModifyCode=304,         //资源未修改
    HttpStatusUnAuthoriztionCode=401,    //请求未授权
    HttpStatusForbiddenCode=403,         //禁止访问
    HttpStatusNotFoundCode=404,          //资源不存在
    HttpStatusReqMethodErrorCode=405,    //请求方法错误。例如要求用POST请求，用了GET
    HttpStatusServerErrorCode=500,       //服务器内部错误
    HttpStatusFalseCode=1000,            //服务器处理失败。用于有或无的状态
    HttpStatusTrueCode=1001,             //服务器处理成功
    HttpStatusMissingArgsCode=1002,      //请求缺少参数，或参数不符合要求
    HttpStatusVerCodeErrorCode=1003,     //验证码错误
    HttpStatusMissingSignCode=1004,      //缺少签名或签名字段错误
    HttpStatusSignErrorCode=1005,        //签名错误
    HttpStatusUploadErrorCode=1006,       //上传文件失败
};
