//
//  YLAnimation.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/14.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLAnimation.h"
#import <UIKit/UIKit.h>

@implementation YLAnimation

- (void)commonAnimation {
    
    // 位置、透明度、旋转角度、形状、颜色   基于CALayer
    
    //1, 逐帧
    // imageView 图片组
    
    
    //2, 关键帧
    [UIView animateWithDuration:1 animations:^{
        
    }];
    
    //CoreAnimation  CAAnimation
    // 属性动画
    CAPropertyAnimation *property;
        CABasicAnimation *basic;
        CAKeyframeAnimation *keyframe;
    
    // 动画组
    CAAnimationGroup *group;
    
    // 转场动画
    CATransition *transition;
    
    
}


- (void)diff {

    //1, drawRect   使用CPU
    
    //2, CAShapeLayer 继承自 CALayer  , 使用GPU
    
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    shaperLayer.path = bezierPath.CGPath;
}


@end
