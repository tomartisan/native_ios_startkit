//
//  GlobalContants.swift
//  FastApp
//
//  Created by tangkunyin on 2016/11/18.
//  Copyright © 2016年 www.shuoit.net. All rights reserved.
//

import UIKit

/**
 *   所有全局常量均在此处定义
 *   使用方式如：GlobalContants.UI.deviceWidth 即可取得设备宽
 */
struct GlobalContants {
    
    // 通用UI尺寸
    struct UI {
        
        static let deviceWidth: CGFloat = UIScreen.main.bounds.size.width
        
        static let deviceHeight: CGFloat = UIScreen.main.bounds.size.height
        
        static let FullScreenRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight)
        
        static let FullVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64)
        
        static let FullTabbarVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64 - 49)
        
        static let SingleLineAdjustOffset: CGFloat = ((1 / UIScreen.main.scale) / 2)
        
    }
    
    // 通用视觉规范
    struct Color {
        static let FSWhiteColor:UIColor = colorWithRGB(255, g: 255, b: 255)          //纯白
        static let FSBlueColor:UIColor = colorWithRGB(0, g: 153, b: 255)             //蓝色
        static let FSOrangeColor:UIColor = colorWithRGB(253, g: 106, b: 60)          //橙色
        static let FSYellowColor:UIColor = colorWithRGB(239, g: 166, b: 68)          //黄色
        static let FSBlackColor:UIColor = colorWithRGB(68, g: 68, b: 68)             //浅黑色
        static let FSGrayColor:UIColor = colorWithRGB(102, g: 102, b: 102)           //灰色
        static let FSlightGrayColor:UIColor = colorWithRGB(153, g:153, b:153)        //浅灰色
        static let FSCoffeeColor:UIColor = colorWithRGB(185,g: 152,b: 99)            //咖啡色
        static let FSCommonBgColor:UIColor = colorWithRGB(248, g: 248, b: 248)       //灰白色
        static let FSSeparatorLineColor:UIColor = colorWithRGB(232, g: 232, b: 232)  //分割线颜色
        static let FSTranslucentColor:UIColor = colorWithRGB(0,g: 0,b: 0, alpha: 0.55)//半透明颜色
    }
    
    // 通用字体
    struct Font {
        static let MainBodyFont: UIFont = htscFontWithSize(12)
        static let MainMenuFont: UIFont = htscFontWithSize(17)
        static let TitleFont: UIFont = htscFontWithSize(14)
        static let BottomMenuFont: UIFont = htscFontWithSize(11)
    }
    
}

