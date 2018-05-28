//
//  Person.m
//  RunTimeDemo
//
//  Created by Eve on 2018/5/28.
//  Copyright © 2018年 CSL. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    // 动态添加eat方法
    // 首先判断sel是不是eat方法 也可以转化成字符串进行比较。
    if (sel == @selector(eat:)) {
        /**
         使用函数class_addMethod为类添加一个方法以及实现
         第一个参数： cls:给哪个类添加方法
         第二个参数： SEL name:添加方法的编号
         第三个参数： IMP imp: 方法的实现，函数入口，函数名可与方法名不同（建议与方法名相同）
         第四个参数： types :方法类型，需要用特定符号，参考API
         */

        class_addMethod(self, sel, (IMP)aaaa , "v@:@");
        // "v@:@" :
        // v -> void 表示无返回值,
        // @ -> object 表示id参数, 指的 self
        // : -> method selector 表示SEL
        // @ -> object 表示id参数, 指的 传递进来的其他参数, 下面列子中的 Num
        // 处理完返回YES
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
//默认任何一个方法都有两个参数。 self : 方法调用者 _cmd : 调用方法编号
void aaaa(id self ,SEL _cmd,id Num)
{
    // 实现内容
    NSLog(@"%@的%@方法动态实现了,参数为%@",self,NSStringFromSelector(_cmd),Num);
}


@end
