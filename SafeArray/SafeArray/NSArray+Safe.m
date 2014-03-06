//
//  NSArray+Safe.m
//  SafeArray
//
//  Created by qiu  on 14-3-6.
//  Copyright (c) 2014年 qiu . All rights reserved.
//

#import "NSArray+Safe.h"


@implementation NSArray (Safe)

+ (void)safe
{
    Method method_ObjectAtIndex = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"),@selector(objectAtIndex:));
    Method method_ObjectAtIndexM = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"),@selector(objectAtIndex:));
    Method method_SafeObjectAtIndex = class_getInstanceMethod(NSClassFromString(@"NSArray"),@selector(objectAtIndexOrNil:));
    Method method_SafeObjectAtIndexM = class_getInstanceMethod(NSClassFromString(@"NSArray"),@selector(objectAtIndexOrNilM:));//这个方法就是一会自己写的拓展进nsarray中的
    method_exchangeImplementations(method_ObjectAtIndex, method_SafeObjectAtIndex);//然后交换就是这么简单 不过这个危险性也是极大的比如整个系统所有的调用这个原生api的调用就全都走到你这来了、必须必须要确保正确性……
    method_exchangeImplementations(method_ObjectAtIndexM, method_SafeObjectAtIndexM);
}

- (id)objectAtIndexOrNil:(NSUInteger)index
{
    return (index < [self count]) ? [self objectAtIndexOrNil:index] : nil;
}
- (id)objectAtIndexOrNilM:(NSUInteger)index
{
    return (index < [self count]) ? [self objectAtIndexOrNilM:index] : nil;
}

@end
