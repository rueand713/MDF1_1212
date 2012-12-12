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
        self.title = NSLocalizedString(@"XML Items", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // create the URL object
    url = [[NSURL alloc] initWithString:@"http://w1.weather.gov/xml/current_obs/KIAH.xml"];
    
    if (url != nil)
    {
        // create the request object to the url
        request = [[NSURLRequest alloc] initWithURL:url];
        
        if (request != nil)
        {
            // create the connection object to receive requested data
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            
            // create the mutable data object
            //requestData = [NSMutableData data];
        }
    }
    
    listTitles = [[NSArray alloc] initWithObjects:@"Location", @"Conditions", @"Temperature", @"Humidity", @"Wind", @"Dewpoint", @"Visibility", @"Longitude", @"Latitude", @"Station ID", @"Credit", nil];
    
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
   requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    
    if (requestString != nil)
    {
        NSLog(@"%@", requestString);
        
        // create the NSXMLParser object with the full data from the request
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:requestData];
        
        if (parser != nil)
        {
            // set the delegate handler to the viewcontroller (self)
            [parser setDelegate:self];
            
            // begin the parsing of the xml
            [parser parse];
        }
        
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // set the currentElement member to the elementName in rotation for
    // character capturing
    currentElement = elementName;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([currentElement isEqualToString: @"location"])
    {
        location = string;
    }
    else if ([currentElement isEqualToString: @"latitude"])
    {
        lat = string;
    }
    else if ([currentElement isEqualToString: @"longitude"])
    {
        lon = string;
    }
    else if ([currentElement isEqualToString: @"observation_time"])
    {
        updateTime = string;
    }
    else if ([currentElement isEqualToString: @"weather"])
    {
        conditions = string;
    }
    else if ([currentElement isEqualToString: @"temperature_string"])
    {
        temp = string;
    }
    else if ([currentElement isEqualToString: @"relative_humidity"])
    {
        humidity = string;
    }
    else if ([currentElement isEqualToString: @"wind_string"])
    {
        wind = string;
    }
    else if ([currentElement isEqualToString: @"dewpoint_string"])
    {
        dewpoint = string;
    }
    else if ([currentElement isEqualToString: @"visibility_mi"])
    {
        visibility = string;
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
