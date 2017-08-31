//
//  LSProgressIndicator.h
//  LSProgressIndicator
//
//  Created by wls on 2017/8/31.
//  Copyright © 2017年 wls. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/** 一个简单的可自定义进度颜色、背景色、圆角的进度条
 *  默认进度是绿色背景色是亮灰色
 *  绘制的圆角，在list里性能会有优化哦
 */
@interface LSProgressIndicator : NSProgressIndicator
/**
 *  进度颜色
 *  默认是绿色
 */
@property (copy) NSColor *progressColor;
/**
 *  背景色
 *  默认是亮灰色
 */
@property (copy) NSColor *roundedColor;
/**
 *  圆角
 */
@property (assign) CGFloat cornerRadius;
/**
 *  初始化方法
 */
- (id)initWithFrame:(NSRect)frameRect
      progressColor:(NSColor*)progressColor
         roundColor:(NSColor*)roundColor
       cornerRadius:(CGFloat)cornerRadius
           minValue:(double)minValue
           maxValue:(double)maxValue
       currentValue:(double)currentValue;
@end
