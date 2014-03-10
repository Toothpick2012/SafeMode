//
//  NSArray+Safe.h
//  SafeArray
//
//  Created by qiu  on 14-3-6.
//  Copyright (c) 2014年 qiu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSArray (Safe)

+ (void)safe;
+ (void)exchangeOriginalMethod:(Method)originalMethod withNewMethod:(Method)newMethod;
+ (Method)arrayMethodOfSelector:(SEL)selector;
- (id)objectAtIndexOrNil:(NSUInteger)index;

@end


@interface NSMutableArray (Safe)

+ (Method)mutaleArrayMethodOfSelector:(SEL)selector;
- (id)objectAtIndexOrNilM:(NSUInteger)index;
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
