//
//  CHModuleABehaviour.m
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHModuleABehaviour.h"

@implementation CHModuleABehaviour

- (ModuleAViewController *)presentA:(NSString *)title{
    ModuleAViewController *vc = [[ModuleAViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.titleLabel.text = title;
    vc.titleLabel.backgroundColor = [UIColor orangeColor];
    return vc;
    
}
- (ModuleAViewController *)pushA:(NSString *)title{
    ModuleAViewController *vc = [[ModuleAViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];

    vc.titleLabel.backgroundColor = [UIColor purpleColor];
    vc.titleLabel.text = title;
    return vc;
}
- (Class )owner{
    return [ModuleAViewController class];
}
- (CHBehaviourCallBack)info{
    CHBehaviourCallBack call = ^(){
        NSLog(@"调用 了info call");
    };
    return call;
}
@end
