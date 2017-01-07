//
//  CHMediator+ModuleA.m
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHMediator+CHModuleABehaviour.h"
#import "NSObject+DLIntrospection.h"

NSString *const className = @"CHModuleABehaviour";
NSString *const present = @"presentA:";
NSString *const push = @"pushA:";

@implementation CHMediator (CHModuleABehaviour)

- (UIViewController *)fetchPresentViewControllerWithIdentifer:(NSInteger)identifer{
    UIViewController *vc = [self performClassName:className method:present completion:^(NSDictionary *info) {
        NSLog(@"info ==%@",info);
    } param:@(identifer),nil];

    return vc;
}
- (UIViewController *)fetchPushViewController{
    
    UIViewController *vc = [self performClassName:className method:push completion:^(NSDictionary *info) {
        NSLog(@"%@",info);
    } param:@"Push",nil];
    
    return vc;
}
@end
