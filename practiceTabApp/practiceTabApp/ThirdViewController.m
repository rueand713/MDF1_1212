//
//  ThirdViewController.m
//  practiceTabApp
//
//  Created by Rueben Anderson on 11/27/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Third", @"Third");
        self.tabBarItem.image = [UIImage imageNamed:@"Second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [UIView]
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
