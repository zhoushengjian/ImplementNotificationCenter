//
//  SJNotificationCenter.m
//  自己实现通知
//
//  Created by zhoushnegjian on 2017/8/22.
//  Copyright © 2017年 zhoushengjian. All rights reserved.
//

#import "SJNotificationCenter.h"

@interface SJNotificationModel : NSObject

@property (nonatomic, weak) id observer;

@property (nonatomic, assign) SEL selector;

@property (nonatomic, copy) NSString *notificationName;


@end

@implementation SJNotificationModel

- (NSString *)description {
    return [NSString stringWithFormat:@"observer:%@\nselector:%@\nname:%@", self.observer, NSStringFromSelector(self.selector), self.notificationName];
}

@end

@interface SJNotificationCenter ()

@property (nonatomic, strong) NSMutableArray *observers;

@end

static SJNotificationCenter *sj_notificationCenter;

@implementation SJNotificationCenter

+ (instancetype)sj_defaultCent {
    if (!sj_notificationCenter) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            sj_notificationCenter = [[self alloc] init];
            sj_notificationCenter->_observers = [NSMutableArray array];
        });
    }
    
    return sj_notificationCenter;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (!sj_notificationCenter) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sj_notificationCenter = [super allocWithZone:zone];
        });
    }
    
    return sj_notificationCenter;
}

- (void)sj_addobserver:(__weak id)observer selector:(SEL)selector name:(NSString *)name {
    
    SJNotificationModel *model = [SJNotificationModel new];
    model.observer = observer;
    model.selector = selector;
    model.notificationName = name;
    
    [self.observers addObject:model];
    
}

- (void)sj_postNotification:(NSString *)name {
    
    for (SJNotificationModel *model in [self.observers copy]) {
        
        if (model.observer == nil) {
            [self.observers removeObject:model];
            continue;
        }
        
        if ([model.notificationName isEqualToString:name] && [model.observer respondsToSelector:model.selector]) {
            [model.observer performSelector:model.selector];
        }
    }
    
}

@end

