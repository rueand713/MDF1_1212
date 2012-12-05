//
//  ThirdViewController.m
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
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
        // set the title of the third tab to 'Free UI'
        self.title = NSLocalizedString(@"Free UI", @"Third");
        
        // set the third tab image to a custom png image
        self.tabBarItem.image = [UIImage imageNamed:@"third"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    // Zooming was removed for being glitchy. Specifically the image sometimes skews instead of zooms
    /*
    // grab the frame of the origImage
    CGRect imgRect = CGRectMake(0.0f, 0.0f, origImage.size.width, origImage.size.height);
    
    // set the frame of the imageView to the grabbed frame saved in imgRect
    // set the imageView image
    imageView.frame = imgRect;
    imageView.image = origImage;
    
    // set the size of the viewable content of the scrollview
    scrollView.contentSize = CGSizeMake(imageView.frame.size.width, imageView.frame.size.height);
    
    // set the max and min scroll range
    scrollView.minimumZoomScale = 0.5f;
    scrollView.maximumZoomScale = 4.0f;
    */
    [super viewWillAppear:true];
}

- (void)viewDidLoad
{
    // capture the original image
    origImage = [UIImage imageNamed:@"RESTful_Link.jpg"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

@end
