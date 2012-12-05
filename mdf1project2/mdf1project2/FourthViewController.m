//
//  FourthViewController.m
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// click handler for the back button
// when clicked it will pop back to the root
- (IBAction)onClick:(id)sender
{
    // creates a uibutton object from the sender argument
    UIButton *button = (UIButton*)sender;
    
    // check if button is created properly
    if (button != nil)
    {
        // button is valid, pop back to the root view (navController)
        [self.navigationController popToRootViewControllerAnimated:true];
    }
}

@end
