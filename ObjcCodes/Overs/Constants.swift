//
//  Constants.swift
//  MFQ-iPhone
//
//  Created by tangkunyin on 16/5/17.
//  Copyright © 2016年 MFQ-iOS. All rights reserved.
//

import UIKit

/**
 *   Swift语言用到的所有常量均在这里定义
 */
struct Constants {
	
	// 通用UI尺寸
	struct UI {
		
		static let deviceWidth: CGFloat = UIScreen.main.bounds.size.width
		
		static let deviceHeight: CGFloat = UIScreen.main.bounds.size.height
		
		static let FullScreenRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight)
		
		static let FullVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64)
		
		static let FullTabbarVCRect: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: deviceHeight - 64 - 49)
		
		static let SINGLE_LINE_ADJUST_OFFSET: CGFloat = ((1 / UIScreen.main.scale) / 2)
		
		static let Rectangle_H40: CGRect = CGRect(x: 0, y: 0, width: deviceWidth, height: 40)
		
		static let Rectangle_H40_span10: CGRect = CGRect(x: 0, y: 0, width: deviceWidth - 20, height: 40)
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
