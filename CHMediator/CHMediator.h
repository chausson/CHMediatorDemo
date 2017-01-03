//
//  CHMediator.h
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TargetBind(a)\
property (copy, nonatomic) NSString *a;\

typedef void (^CHMeditorCallBack)(NSDictionary *info);

@interface CHMediator : NSObject

@TargetBind(CHModuleABehaviour)
+ (CHMediator *)sharedInstance;

- (id )performClassName:(NSString *)className
                 method:(NSString *)methodName
             completion:(CHMeditorCallBack )completion
                  param:(id )parm,...;

- (id )performClassName:(NSString *)className
                 method:(NSString *)methodName
                  param:(id )parm,...;

- (id )performWithURL:(NSURL *)url
           completion:(CHMeditorCallBack )completion;

#pragma mark TODO 网络调用接口
@end
