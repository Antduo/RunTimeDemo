//
//  Person+associated.m
//  RunTimeDemo
//
//  Created by Eve on 2018/5/28.
//  Copyright © 2018年 CSL. All rights reserved.
//

#import "Person+associated.h"
#import <objc/runtime.h>
@implementation Person (associated)

// 方法一：我们可以通过使用静态全局变量给分类添加属性
//static NSString *_name;
//-(void)setName:(NSString *)name
//{
//    NSLog(@"===%@",name);
//    _name = name;
//}
//-(NSString *)name
//{
//    return _name;
//}
//但是这样_name静态全局变量与类并没有关联，无论对象创建与销毁，只要程序在运行_name变量就存在，并不是真正意义上的属性。


//方法二：使用RunTime动态添加属性 RunTime提供了动态添加属性和获得属性的方法。
- (void)setName:(NSString *)name
{
    NSLog(@"===%@",name);
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}

/**
 动态添加属性:
 
 objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
 参数一：id object : 给哪个对象添加属性，这里要给自己添加属性，用self。
 参数二：void * == id key : 属性名，根据key获取关联对象的属性的值，在**objc_getAssociatedObject中通过次key获得属性的值并返回。
 参数三：id value** : 关联的值，也就是set方法传入的值给属性去保存。
 参数四：objc_AssociationPolicy policy : 策略，属性以什么形式保存。
 有以下几种:
 typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
    OBJC_ASSOCIATION_ASSIGN = 0,  // 指定一个弱引用相关联的对象
    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, // 指定相关对象的强引用，非原子性
    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,  // 指定相关的对象被复制，非原子性
    OBJC_ASSOCIATION_RETAIN = 01401,  // 指定相关对象的强引用，原子性
    OBJC_ASSOCIATION_COPY = 01403     // 指定相关的对象被复制，原子性
 };
 */

/**
 获得属性
 
 objc_getAssociatedObject(id object, const void *key);

 参数一：id object : 获取哪个对象里面的关联的属性。
 参数二：void * == id key : 什么属性，与**objc_setAssociatedObject**中的key相对应，即通过key值取出value。
 */


@end
