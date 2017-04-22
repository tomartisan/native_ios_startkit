//
//  FSConstants.swift
//  FastApp
//
//  Created by tangkunyin on 2017/4/22.
//  Copyright © 2017年 www.shuoit.net. All rights reserved.
//

import UIKit

/**
 *   所有全局常量均在此处定义
 *   使用方式如：FSConstants.UI.deviceWidth 即可取得设备宽
 */
struct FSConstants {
    
    
    /// 开发模式
    static let isDevelopModel:Bool = true
    
    /// 服务器连接超时时间
    static let serverTimeout:Double = 45.0
    
    /// API服务器地址
    static let appServer:String = "http://www.shuoit.net"
    
    /// DES3 KEY (必须是24位)
    static let desKey:String = "123456781234567812345678"
    
    /// MD5 KEY (8位)
    static let md5Key:String = "88888888"
    
    /// 分页每页的条数
    static let pageRows:Int = 10
    
    
    /// 事件消息key定义
    struct MessageKey {
        
        //网络请求失败
        static let serverRequestFailure: String = "ServerRequestFailure"
        
        //轮播图点击事件
        static let scrollImageViewClicked: String = "ScrollImageViewClicked"
    }
    
    
    /// 通用UI尺寸
    struct UI {
        
        static let deviceWidth: CGFloat = UIScreen.main.bounds.size.width
        
        static let deviceHeight: CGFloat = UIScreen.main.bounds.size.height
        
        static let fullScreenRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight)
        
        static let fullVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64)
        
        static let fullTabbarVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64 - 49)
        
        static let singleLineAdjustOffset: CGFloat = ((1 / UIScreen.main.scale) / 2)
        
    }
    
    /// 通用视觉规范
    struct Color {
        static let whiteColor:UIColor = colorWithRGB(255, g: 255, b: 255)          //纯白
        static let blueColor:UIColor = colorWithRGB(0, g: 153, b: 255)             //蓝色
        static let orangeColor:UIColor = colorWithRGB(253, g: 106, b: 60)          //橙色
        static let yellowColor:UIColor = colorWithRGB(239, g: 166, b: 68)          //黄色
        static let blackColor:UIColor = colorWithRGB(68, g: 68, b: 68)             //浅黑色
        static let grayColor:UIColor = colorWithRGB(102, g: 102, b: 102)           //灰色
        static let lightGrayColor:UIColor = colorWithRGB(153, g:153, b:153)        //浅灰色
        static let coffeeColor:UIColor = colorWithRGB(185,g: 152,b: 99)            //咖啡色
        static let commonBgColor:UIColor = colorWithRGB(248, g: 248, b: 248)       //灰白色
        static let separatorLineColor:UIColor = colorWithRGB(232, g: 232, b: 232)  //分割线颜色
        static let translucentColor:UIColor = colorWithRGB(0,g: 0,b: 0, alpha: 0.55)//半透明颜色
    }
    
    /// 通用字体
    struct Font {
        static let mainBodyFont: UIFont = htscFontWithSize(12)
        static let mainMenuFont: UIFont = htscFontWithSize(17)
        static let titleFont: UIFont = htscFontWithSize(14)
        static let bottomMenuFont: UIFont = htscFontWithSize(11)
    }
    
}


