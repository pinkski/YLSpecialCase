//
//  YLCGView.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/19.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLCGView.h"

@implementation YLCGView

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    //1 context
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //2 path
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextAddPath(ref, path);
    
    //3 stroke or fill
    CGContextStrokePath(ref);
    CGContextFillPath(ref);
}

@end
