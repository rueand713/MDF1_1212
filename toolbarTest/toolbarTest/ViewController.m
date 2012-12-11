//
//  ViewController.m
//  toolbarTest
//
//  Created by Rueben Anderson on 12/10/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender
{
    UIBarButtonItem *barItem = (UIBarButtonItem *)sender;
    if (barItem != nil)
    {
        if (barItem.tag == 0)
        {
            headerLabel.text = @"HOME";
        }
        else if (barItem.tag == 1)
        {
            headerLabel.text = @"SETTINGS";
        }
    }
}

@end
