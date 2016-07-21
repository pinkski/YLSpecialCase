//
//  YLBlock.h
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/20.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YLSpecialBlock)(void);

@interface YLBlock : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) YLSpecialBlock specialBlock;

@property (nonatomic, copy) void(^firstBlock)(void);



@end
