//
//  LSProgressIndicator.m
//  LSProgressIndicator
//
//  Created by wls on 2017/8/31.
//  Copyright © 2017年 wls. All rights reserved.
//

#import "LSProgressIndicator.h"
#import "CXLiveManger.h"

@implementation LSProgressIndicator
//兼容xib
- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configProgressColor:[NSColor greenColor]
                       roundColor:[NSColor lightGrayColor]
                     cornerRadius:0
                         minValue:0
                         maxValue:100
                     currentValue:0];
    }
    return self;
}
//一键配置🙄
- (id)initWithFrame:(NSRect)frameRect
      progressColor:(NSColor*)progressColor
         roundColor:(NSColor*)roundColor
       cornerRadius:(CGFloat)cornerRadius
           minValue:(double)minValue
           maxValue:(double)maxValue
       currentValue:(double)currentValue
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
        [self configProgressColor:progressColor
                       roundColor:roundColor
                     cornerRadius:cornerRadius
                         minValue:minValue
                         maxValue:maxValue
                     currentValue:currentValue];
    }
    return self;
}
//配置颜色等
- (void)configProgressColor:(NSColor*)progressColor
                 roundColor:(NSColor*)roundColor
               cornerRadius:(CGFloat)cornerRadius
                   minValue:(double)minValue
                   maxValue:(double)maxValue
               currentValue:(double)currentValue{
    self.progressColor = progressColor?:[NSColor greenColor];
    self.roundedColor  = roundColor?:[NSColor lightGrayColor];
    self.cornerRadius  = cornerRadius?:0;
    self.minValue      = minValue?:0;
    self.maxValue      = maxValue?:100;
    self.doubleValue   = currentValue?:0;
}
//重写绘制方法
- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    [self drawDiy];
}
//自定义进度和背景
-(void)drawDiy{
    float distance = [self maxValue]-[self minValue];
    float value = ([self doubleValue]) ? [self doubleValue]/distance : 0;
    [self drawRoundedWithRadius:self.cornerRadius];
    if (value) {
        NSRect bounds = NSMakeRect(0, 0, self.frame.size.width*value, self.frame.size.height);
        [self drawProgressWithBounds:bounds Radius:self.cornerRadius];
    }
}
//重绘背景色及背景圆角
-(void)drawRoundedWithRadius:(CGFloat)radius{
    NSBezierPath* roundedRect = [NSBezierPath bezierPathWithRoundedRect:NSMakeRect(0, 0, self.bounds.size.width, self.bounds.size.height) xRadius:radius yRadius:radius];
    [self.roundedColor set];
    [roundedRect fill];
}
//重绘进度色及进度圆角
-(void)drawProgressWithBounds:(NSRect)frame Radius:(CGFloat)radius{
    NSBezierPath* bounds = [NSBezierPath bezierPathWithRoundedRect:frame xRadius:radius yRadius:radius];
    NSGradient* gradient = [[NSGradient alloc] initWithStartingColor:self.progressColor endingColor:self.progressColor];
    [gradient drawInBezierPath:bounds angle:90];
}

@end
