//
//  UIControl+Limit.h
//  MethodSwizzlingDemo
//
//  Created by ChenMan on 2018/5/3.
//  Copyright © 2018年 cimain. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 防止按钮重复点击
 */
@interface UIControl (Limit)

@property (nonatomic,assign) NSTimeInterval acceptEventInterval;
@property (nonatomic)BOOL ignoreEvent;

@end
