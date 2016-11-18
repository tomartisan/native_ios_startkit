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
        static let BlueColor: UIColor = colorWithRGB(0, g: 153, b: 255) // 主色调（蓝色）
        static let OrangeColor: UIColor = colorWithRGB(242, g: 109, b: 95) // 辅色调（橙色）
        static let YellowColor: UIColor = colorWithRGB(239, g: 166, b: 68) // 辅色调（黄色）
        static let WhiteColor: UIColor = grayColor(255) // 纯白
        static let BlackColor: UIColor = grayColor(53) // 标题文字（浅黑色）
        static let GrayColor: UIColor = grayColor(102) // 正文文字（灰色）
        static let LightGrayColor: UIColor = grayColor(153) // 标注文字（浅灰色）
        static let CommonBgColor: UIColor = grayColor(248) // 背景色
        static let SeparatorLineColor: UIColor = grayColor(232) // 分割线颜色
        static let TranslucentColor: UIColor = colorWithRGB(0, g: 0, b: 0, alpha: 0.55) // 半透明颜色
    }
    
    // 通用字体
    struct Font {
        static let MainBodyFont: UIFont = htscFontWithSize(12)
        static let MainMenuFont: UIFont = htscFontWithSize(17)
        static let TitleFont: UIFont = htscFontWithSize(14)
        static let BottomMenuFont: UIFont = htscFontWithSize(11)
    }
    
}

