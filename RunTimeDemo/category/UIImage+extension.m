//
//  UIImage+extension.m
//  RunTimeDemo
//
//  Created by Eve on 2018/5/28.
//  Copyright © 2018年 CSL. All rights reserved.
//

#import "UIImage+extension.h"
#import <objc/runtime.h>
@implementation UIImage (extension)


/**
 当系统自带的方法功能不够，需要给系统自带的方法扩展一些功能，并且保持原有的功能时，可以使用RunTime交换方法实现。
 
 这里要实现image添加图片的时候，自动判断image是否为空，如果为空则提醒图片不存在。
 
 */
+ (void)load
{
    // 获取要交换的两个方法
    // 获取类方法  用Method 接受一下
    // class ：获取哪个类方法
    // SEL ：获取方法编号，根据SEL就能去对应的类找方法。
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    
    // 获取第二个类方法
    Method ll_imageNamed = class_getClassMethod(self, @selector(ll_imageNamed:));

    // 交换两个方法的实现 方法一 ，方法二。
    method_exchangeImplementations(imageNamed, ll_imageNamed);
    // IMP其实就是 implementation的缩写：表示方法实现。
}

+ (instancetype)ll_imageNamed:(NSString *)name
{
    // 加载图片 调用xx_ccimageNamed方法，防止循环引用造成死循环
    UIImage *image = [UIImage ll_imageNamed:name];
    // 个人理解: 交换方法后,当我们调用 ll_imageNamed:方法 时, 实则调用的是系统的 imageNamed: 方法
    if (image) {
        NSLog(@"图片存在");
    }else{
        NSLog(@"图片不存在");
    }
    
    return image;
}

@end
