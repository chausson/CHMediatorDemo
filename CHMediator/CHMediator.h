//
//  CHMediator.h
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^CHMeditorCallBack)(NSDictionary *info);

@interface CHMediator : NSObject

+ (CHMediator *)sharedInstance;

- (id )performClassName:(NSString *)className
                 method:(NSString *)methodName
             completion:(CHMeditorCallBack )completion
                  param:(id )parm,...;

- (id )performClassName:(NSString *)className
                 method:(NSString *)methodName
                  param:(id )parm,...;

#pragma mark TODO 网络调用接口

- (id )performWithURL:(NSURL *)url
           completion:(CHMeditorCallBack )completion;


@end
