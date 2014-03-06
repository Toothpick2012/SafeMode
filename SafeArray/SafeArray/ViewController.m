//
//  ViewController.m
//  SafeArray
//
//  Created by qiu  on 14-3-6.
//  Copyright (c) 2014年 qiu . All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Safe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [NSArray safe];
    NSArray *a = [NSArray arrayWithObjects:@"0",@"1",nil];
    for (int i=0; i<5; i++) {
        NSLog(@"NO%d:%@",i,[a objectAtIndex:i]);
    }
    NSMutableArray *b = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",nil];
    for (int i=0; i<5; i++) {
        NSLog(@"NO%d:%@",i,[b objectAtIndex:i]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
