//
//  SJViewController.m
//  自己实现通知
//
//  Created by zhoushnegjian on 2017/8/22.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#import "SJViewController.h"
#import "SJNotificationCenter.h"

@interface SJViewController ()

@property (nonatomic, copy) NSString *str;

@end

@implementation SJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[SJNotificationCenter sj_defaultCent] sj_postNotification:@"haha"];
//    
//    [[SJNotificationCenter sj_defaultCent] sj_addobserver:self selector:@selector(ggg) name:@"balabala"];
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"abc" object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserverForName:@"dasd" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//        self.str = @"as";
//    }];
}

- (void)dealloc {
    NSLog(@"♻️ Dealloc %@", NSStringFromClass([self class]));
}

- (void)ggg {
    NSLog(@"asdakjsdhkjasd");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[SJNotificationCenter sj_defaultCent] sj_postNotification:@"balabala"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
