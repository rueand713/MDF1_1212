//
//  FirstViewController.m
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "FirstViewController.h"
#import "FourthViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // set the title of the first tab to 'Home'
        self.title = NSLocalizedString(@"Home", @"First");
        
        // set the tab image
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    // change the navController nav bar tintColor
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    [super viewWillAppear:true];
}

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

// click handler for the about button
- (IBAction)onClick:(id)sender
{
    // create a UIButton object of casted sender
    UIButton *button = (UIButton*)sender;
    
    // verify that the button object is valid
    if (button != nil)
    {
        // button is valid, create a view controller object for fourthViewController and push it onto the navController stack
        FourthViewController *fourthView = [[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil];
        [self.navigationController pushViewController:fourthView animated:true];
    }
}

@end
