//
//  ViewController.m
//  自己实现通知
//
//  Created by zhoushnegjian on 2017/8/22.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#import "ViewController.h"
#import "SJNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[SJNotificationCenter sj_defaultCent] sj_addobserver:self selector:@selector(aaa) name:@"haha"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(originNotification) name:@"abc" object:nil];

}

- (void)dealloc {
    NSLog(@"♻️ Dealloc %@", NSStringFromClass([self class]));
}

- (void)aaa {
    NSLog(@"d----d---d");
}

- (void)originNotification {
    NSLog(@"%s", __func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
