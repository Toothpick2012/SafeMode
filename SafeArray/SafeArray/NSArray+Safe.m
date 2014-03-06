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
    //NSArray
    [NSArray exchangeOriginalMethod:[self arrayMethodOfSelector:@selector(objectAtIndex:)] withNewMethod:[NSArray arrayMethodOfSelector:@selector(objectAtIndexOrNil:)]];
    
    //NSMutableArray
    [NSArray exchangeOriginalMethod:[NSMutableArray mutaleArrayMethodOfSelector:@selector(objectAtIndex:)] withNewMethod:[NSMutableArray mutaleArrayMethodOfSelector:@selector(objectAtIndexOrNilM:)]];
    [NSArray exchangeOriginalMethod:[NSMutableArray mutaleArrayMethodOfSelector:@selector(replaceObjectAtIndex:withObject:)] withNewMethod:[NSMutableArray mutaleArrayMethodOfSelector:@selector(safe_replaceObjectAtIndex:withObject:)]];
}

+ (void)exchangeOriginalMethod:(Method)originalMethod withNewMethod:(Method)newMethod
{
    method_exchangeImplementations(originalMethod, newMethod);
}

#pragma mark - NSArray
+ (Method)arrayMethodOfSelector:(SEL)selector
{
    return class_getInstanceMethod(NSClassFromString(@"__NSArrayI"),selector);
}


- (id)objectAtIndexOrNil:(NSUInteger)index
{
    return (index < [self count]) ? [self objectAtIndexOrNil:index] : nil;
}

@end


@implementation NSMutableArray (Safe)


#pragma mark - NSMutableArray
+ (Method)mutaleArrayMethodOfSelector:(SEL)selector
{
    return class_getInstanceMethod(NSClassFromString(@"__NSArrayM"),selector);
}

- (id)objectAtIndexOrNilM:(NSUInteger)index
{
    return (index < [self count]) ? [self objectAtIndexOrNilM:index] : nil;
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if ((index < [self count])&&anObject) {
        [self safe_replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
