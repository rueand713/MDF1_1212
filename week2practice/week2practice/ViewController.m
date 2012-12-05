//
//  ViewController.m
//  week2practice
//
//  Created by Rueben Anderson on 11/27/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self printString:@""];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)printString:(NSString *)string
{
    NSAssert((string != nil), @"String is null!");
}

- (IBAction)onClick:(id)sender
{
    SecondViewController *secView = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    if (secView != nil)
    {
        [self.navigationController pushViewController:secView animated:true];
    }
}

@end
