//
//  ViewController.m
//  SafeModeExample
//
//  Created by qiu  on 14-3-10.
//  Copyright (c) 2014年 qiu . All rights reserved.
//

#import "ViewController.h"
#import "SafeMode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [SafeMode safe];
    
    NSArray *a = [NSArray arrayWithObjects:@"0",@"1",nil];
    for (int i=0; i<5; i++) {
        NSLog(@"NO%d:%@",i,[a objectAtIndex:i]);
    }
    
    NSMutableArray *b = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",nil];
    for (int i=0; i<5; i++) {
        NSLog(@"NO%d:%@",i,[b objectAtIndex:i]);
    }
    [b replaceObjectAtIndex:1 withObject:@"8"];
    [b replaceObjectAtIndex:7 withObject:@"8"];
    [b replaceObjectAtIndex:1 withObject:nil];
    NSLog(@"%@",b);
    
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    [d setObject:nil forKey:@"hello"];
    
    NSLog(@"begin");
    for (int i=0; i<200000; i++) {
        [self.view addSubview:self.view];
    }
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
