//
//  CHModuleABehaviour.h
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHBehaviour.h"
#import "ModuleAViewController.h"
@interface CHModuleABehaviour : CHBehaviour
- (ModuleAViewController *)presentA:(NSString *)title;
- (ModuleAViewController *)pushA:(NSString *)title;

@end
