//
//  CHBehaviour.h
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
    页面切换某些操作行为的基类
    需要说明Behaviour的所属者
 */
typedef void (^CHBehaviourCallBack)();

@interface CHBehaviour : NSObject
- (NSString *)className;
- (Class )owner; // 需要子类实现
- (UIViewController *)defultController;

/**
 @brief 执行Mediator Catagetory的方法后会调用
 */
@property (copy ,nonatomic) CHBehaviourCallBack info;

@end
