//
//  ViewController.m
//  RunTimeDemo
//
//  Created by Eve on 2018/5/28.
//  Copyright © 2018年 CSL. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+associated.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 交换方法
    self.imgView.image = [UIImage imageNamed:@"lufei.jpg"];
    
    // 动态添加方法
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(eat:)withObject:@"xx_cc"];
    
    // 关联属性
    p.name = @"王大锤";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
