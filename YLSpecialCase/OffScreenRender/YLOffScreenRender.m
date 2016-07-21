//
//  YLOffScreenRender.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/21.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLOffScreenRender.h"

@implementation YLOffScreenRender

- (void)run {
    
    // 离屏渲染 与之相对的是 On-Screen Rendering，即在当前屏幕渲染，意思是渲染操作是用于在当前屏幕显示的缓冲区进行。那么离屏渲染则是指图层在被显示之前是在当前屏幕缓冲区以外开辟的一个缓冲区进行渲染操作。
    
    // 离屏渲染需要多次切换上下文环境：先是从当前屏幕（On-Screen）切换到离屏（Off-Screen）；等到离屏渲染结束以后，将离屏缓冲区的渲染结果显示到屏幕上又需要将上下文环境从离屏切换到当前屏幕，而上下文环境的切换是一项高开销的动作
    
    // 通常图层的以下属性将会触发离屏渲染：
    
    //1, 阴影
    UIView *view = [UIView new];
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowRadius = 5;
    
    //2,圆角
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    
    //3,图层蒙板(触发CoreAnimation 离屏渲染)
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
    imageView.layer.shadowRadius = 5.0f;
    imageView.layer.shadowOpacity = 0.6;
    
    //3,图层蒙板（不会触发离屏渲染）
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView2.layer.shadowPath = [[UIBezierPath bezierPathWithRect:
                                   CGRectMake(imageView.bounds.origin.x+5, imageView.bounds.origin.y+5,imageView.bounds.size.width, imageView.bounds.size.height)] CGPath];
    imageView2.layer.shadowOpacity = 0.6;
    
    // 有缓存
    imageView.image = [UIImage imageNamed:@"wocha"];
    // 无缓存
    imageView2.image = [UIImage imageWithContentsOfFile:@"wocha"];
}

@end
