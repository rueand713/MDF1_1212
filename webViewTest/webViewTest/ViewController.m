//
//  ViewController.m
//  webViewTest
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
    // create an NSURL object of a chosen url string
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.yahoo.com"];
    
    if (url != nil)
    {
        // create an URL request object with the url object
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        if (request != nil)
        {
            if (!myWebView.canGoBack)
            {
                // set the button to start disabled initially
                backBtn.enabled = false;
                
                // back up by setting the button to be enabled or disabled based on the
                // webView's canGoBack method
                backBtn.enabled = (myWebView.canGoBack);
            }
            
            // load the url request within the web view
            [myWebView loadRequest:request];
        }
    }
    
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
    UIBarButtonItem *item = (UIBarButtonItem *)sender;
    
    if (item != nil)
    {
        if (item.tag == 0)
        {
            if (myWebView.canGoBack)
            {
                // if the back button is pressed and there is a page to go back to
                // go to the previous web page
                [myWebView goBack];
            }
        }
        else if (item.tag == 1)
        {
            if (myWebView.isLoading)
            {
                // if the webview is loading content and the stop button is clicked
                // the stopLoading method will be called on the webview to halt the loading
                [myWebView stopLoading];
            }
        }
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // when the page is done loading check if there is a page to return to
    // from within the webView by calling the canGoBack method. The enabled property of the back
    // button will be set based on the return value of the webView method TRUE or FALSe
    backBtn.enabled = (myWebView.canGoBack);
}

@end
