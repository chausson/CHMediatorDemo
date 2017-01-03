//
//  CHBehaviour.m
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHBehaviour.h"

@implementation CHBehaviour
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self owner];
    }
    return self;
}
- (NSString *)className{
    return NSStringFromClass(self.class);
}
- (Class )owner{
    NSAssert(NO, @"子类必须说明所属者的Class");
    return nil;
}
- (UIViewController *)defultController{
    return [[[self owner] alloc]init];
}
@end
