//
//  FirstViewController.m
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // create the URL object
    url = [[NSURL alloc] initWithString:@"http://www.fullsail.com"];
    
    if (url != nil)
    {
        // create the request object to the url
        request = [[NSURLRequest alloc] initWithURL:url];
        
        if (request != nil)
        {
            // create the connection object to receive requested data
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            
            // create the mutable data object
            requestData = [NSMutableData data];
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

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        // append the data to the existing mutable data
        //[requestData appendData:data];
        
        if (requestData)
        {
            [requestData appendData:data];
        }
        else
        {
            requestData = [data mutableCopy];
        }
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   NSString *requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    
    if (requestString != nil)
    {
        NSLog(@"%@", requestString);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *cellId = @"Cell";
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%d", indexPath.row];
    
    return  cell;
}

@end
