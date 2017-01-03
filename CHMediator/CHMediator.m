//
//  CHMediator.m
//  CHMediatorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "CHMediator.h"
#import <objc/runtime.h>
@implementation CHMediator
+ (instancetype)sharedInstance
{
    static CHMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CHMediator alloc] init];
    });
    return mediator;
}
- (id )performClassName:(NSString *)className
                   method:(NSString *)methodName
                    param:(id )parm,...{
    
    return  [self performClassName:className method:methodName completion:nil param:parm];
}
- (id )performClassName:(NSString *)className
                   method:(NSString *)methodName
               completion:(CHMeditorCallBack )completion
                    param:(id )parm,...{
    
    NSMutableArray * mutableArray = [NSMutableArray array];
    if (parm)                            // The first argument isn't part of the varargs list,
    {                                                   // so we'll handle it separately.
        va_list args;
        va_start(args, parm);    // Start scanning for arguments after firstViewController
        for (id eachObject = parm; eachObject != nil; eachObject = va_arg(args, id)) {
            [mutableArray addObject:eachObject];
        }
        va_end(args);
    }
    if (![self isValid:className method:methodName parmNumber:mutableArray.count]) {
        return nil;
    }
    id target = [[NSClassFromString(className) alloc] init];

    SEL action = NSSelectorFromString(methodName);
    NSMethodSignature *signature = [target methodSignatureForSelector:action];

    if (signature) {
            id strongReturnValue ;
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:target];
            [invocation setSelector:action];
            NSUInteger len = signature.numberOfArguments;
            //如果参数的个数大于1（len >2,0为方法拥者，1，为方法名)
            if(len > 2){
                for (int i =0 ; i < mutableArray.count ; i++){
                    id value = mutableArray[i];
                    [invocation setArgument:&value atIndex:i+2];
                }
            }
        //执行方法
            [invocation invoke];
            if ([target valueForKey:@"info"]) {
                [[target valueForKey:@"info"] invoke];

            }
            void * returnValue ;
            if(signature.methodReturnLength){
                [invocation getReturnValue:&returnValue];
            }
            strongReturnValue = (__bridge id)returnValue;;
        return strongReturnValue;
    }else{
        NSString *domin = [NSString stringWithFormat:@"%s %d",__PRETTY_FUNCTION__,__LINE__];
        NSError *error = [NSError errorWithDomain:domin code:-400 userInfo:nil];
        if (completion) {
            completion(nil);
        }
        return error;
        
    }
//    id returnValue = [target performSelector:action withObject:parm];
//
//    return returnValue;

}
- (id)performWithURL:(NSURL *)url completion:(CHMeditorCallBack)completion{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *urlString = [url query];
    for (NSString *param in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [params setObject:[elts lastObject] forKey:[elts firstObject]];
    }
    NSString *methodName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    return  [self performClassName:url.host method:methodName completion:completion param:params];
 
}

- (BOOL )isValid:(NSString *)className
          method:(NSString *)methodName
      parmNumber:(NSInteger)count{
    Class targetClass = NSClassFromString(className);
    NSString * message = [NSString stringWithFormat:@"%s %d",__PRETTY_FUNCTION__,__LINE__];
    if (!targetClass ) {
        NSLog(@"%@ targetClass 不存在",message);
        return  NO;
    }
    if (![targetClass isSubclassOfClass:NSClassFromString(@"CHBehaviour")]) {
        NSLog(@"%@ 类型不是CHBehaviour的子类 不存在",message);

        return NO;
    }
    NSInteger strCount = [methodName length] - [[methodName stringByReplacingOccurrencesOfString:@":" withString:@""] length];
    if (strCount != count) {
        NSLog(@"%@ 方法命名的参数不对",message);

        return NO;
    }
    
    return YES;
}
@end
