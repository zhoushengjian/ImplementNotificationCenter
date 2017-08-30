//
//  SJNotificationCenter.h
//  自己实现通知
//
//  Created by zhoushnegjian on 2017/8/22.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJNotificationCenter : NSObject

+ (instancetype)sj_defaultCent;

- (void)sj_addobserver:(__weak id)observer selector:(SEL)selector name:(NSString *)name;

- (void)sj_postNotification:(NSString *)name;

@end

