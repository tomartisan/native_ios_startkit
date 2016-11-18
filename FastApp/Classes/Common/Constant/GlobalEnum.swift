//
//  GlobalEnum.swift
//  FastApp
//
//  Created by tangkunyin on 2016/11/18.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

import Foundation

// 位置类型
enum FSLayoutAlignmentType:Int {
    case AlignmentCenter = 0, AlignmentTop , AlignmentBottom , AlignmentLeft , AlignmentRight
}


// 网络状态
enum FSNetStateCode {
    case FSNetStatusReachable       //有网络
    case FSNetStatusNotReachable    //无网络
}


// HTTP返回码
enum FSHttpStatusCode:Int {
    //通用状态码
    case HttpStatusSuccessCode = 200           //请求成功
    case HttpStatusNotModifyCode = 304         //资源未修改
    case HttpStatusUnAuthoriztionCode = 401    //请求未授权
    case HttpStatusForbiddenCode = 403         //禁止访问
    case HttpStatusNotFoundCode = 404          //资源不存在
    case HttpStatusReqMethodErrorCode = 405    //请求方法错误。例如要求用POST请求，用了GET
    case HttpStatusServerErrorCode = 500       //服务器内部错误
    
    //自定义状态码(可根据接口实际情况更改)
    case DataParseErrorCode = -1               //数据解析错误
    case HttpStatusReturnNullCode = 0          //服务返回为空
    case HttpStatusFalseCode = 1000            //请求失败(可能是未知原因)
    case HttpStatusTrueCode = 1001             //请求成功
    case HttpStatusMissingArgsCode = 1002      //请求缺少参数，或参数不符合要求
    case HttpStatusVerCodeErrorCode = 1003     //验证码错误
    case HttpStatusMissingSignCode = 1004      //缺少签名或签名字段错误
    case HttpStatusSignErrorCode = 1005        //签名错误
    case HttpStatusUploadErrorCode = 1006      //上传文件失败
}
