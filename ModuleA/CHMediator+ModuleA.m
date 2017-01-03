//
//  CHMediator+ModuleA.m
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHMediator+ModuleA.h"
#import "NSObject+DLIntrospection.h"
#import <objc/runtime.h>
NSString *const className = @"CHModuleABehaviour";
NSString *const present = @"presentA:";
NSString *const push = @"pushA:";

@implementation CHMediator (ModuleA)
+ (void)name{
    NSLog(@"name =%@",self);
}
- (UIViewController *)fetchPresentViewController{
    UIViewController *vc = [self performClassName:className method:present completion:^(NSDictionary *info) {
        NSLog(@"info ==%@",info);
    } param:@"Present",nil];

    return vc;
}
- (UIViewController *)fetchPushViewController{
    
    UIViewController *vc = [self performClassName:className method:push completion:^(NSDictionary *info) {
        NSLog(@"%@",info);
    } param:@"Push",nil];
    
    return vc;
}
@end
