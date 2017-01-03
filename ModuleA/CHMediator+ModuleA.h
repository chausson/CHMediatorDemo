//
//  CHMediator+ModuleA.h
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHMediator.h"
#import <UIKit/UIKit.h>

@interface CHMediator (ModuleA)

- (UIViewController *)fetchPresentViewController;
- (UIViewController *)fetchPushViewController;
@end
