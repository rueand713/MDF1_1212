//
//  FirstViewController.m
//  mdf1project4
//
//  Created by Rueben Anderson on 12/11/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "FirstViewController.h"
#import "ThirdViewController.h"

// typedef for the didSelectRowAtIndexPath method
// using a typedef as a string representation of the numeric values that must be supplied to the switch
typedef enum
{
    LOCATION = 0,
    CONDITIONS,
    TEMPERATURE,
    HUMIDITY,
    WIND,
    WINDCHILL,
    PRESSURE,
    ALTIMETER,
    DEWPOINT,
    VISIBILITY,
    LONGITUDE,
    LATITUDE,
    STATIONID,
    CREDIT
}xmlListData;

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
    // initialize the weatherLocales object with the XML weather feeds for different locations
    weatherLocales = [[NSArray alloc] initWithObjects:@"http://w1.weather.gov/xml/current_obs/KIAH.xml", @"http://w1.weather.gov/xml/current_obs/KMCO.xml", @"http://w1.weather.gov/xml/current_obs/KNYC.xml", @"http://w1.weather.gov/xml/current_obs/KLAX.xml", @"http://w1.weather.gov/xml/current_obs/KORD.xml", nil];
    
    // instantiate the table list object with the appropariate titles for the xml data that will be fetched and parsed
    listTitles = [[NSArray alloc] initWithObjects:@"Location", @"Conditions", @"Temperature", @"Humidity", @"Wind", @"Wind Chill", @"Pressure", @"Altimeter", @"Dewpoint", @"Visibility", @"Longitude", @"Latitude", @"Station ID", @"Credit", nil];
    
    // instantiate the cities array
    cities = [[NSArray alloc] initWithObjects:@"HOUSTON", @"ORLANDO", @"NEW YORK CITY", @"LAS ANGELES", @"CHICAGO", nil];
    
    // set the starting city
    currentCity = [cities objectAtIndex:0];
    
    // call the method to fetch the XML data and parse it
    [self fetchXML:[weatherLocales objectAtIndex:0]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// this function will fetch or update the application objects with the targetted XML data
- (void)fetchXML:(NSString *)urlToXML
{
    // create the URL object with the first weather location
    url = [[NSURL alloc] initWithString:urlToXML];
    
    // if the url object is created properly the request object will be created with that url
    if (url != nil)
    {
        // create the request object to the url
        request = [[NSURLRequest alloc] initWithURL:url];
        
        // if the request object has been created properly, the  connection object will be created with that request
        if (request != nil)
        {
            // create the connection object to receive requested data
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // if the data is not nil and the requestData object has been created
    // the data will be appended to the existing data otherwise the data will be used
    // to instantiate the requestData object for the first time
    if (data != nil)
    {
        if (requestData)
        {
            // append the data to the existing mutable data
            [requestData appendData:data];
        }
        else
        {
            // data is null so create the requestData object
            requestData = [data mutableCopy];
        }
    }
}

// this method is called when the connection request has finished loading all of the data
// so since the data is complete upon firing, the NSXMLParser object has been created here with the new complete data
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // store the data in the requestData object in string format within the NSString object
    // this will later be passed into the second view for debug display
   requestString = [[NSString alloc] initWithData:requestData encoding:NSASCIIStringEncoding];
    
    // create the NSXMLParser object with the complete data from the request
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:requestData];
    
    // if the parser object has been created properly the delegate will be set to the view controller
    // and the xml document will begin to be parsed with the NSXMLParser parse method
    if (parser != nil)
    {
        // set the delegate handler to the viewcontroller (self)
        [parser setDelegate:self];
        
        // begin the parsing of the xml
        [parser parse];
    }
}

// this method is called when the parser reaches a new element tag
// because the xml document being retrieved uses element text instead of properties for display of the data
// only the elementName will be extracted and stored within a class member for use in a later parser method
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // reset the parseController every element to allow for parsing
    // in the foundCharacters method
    parseController = false;
    
    // set the currentElement member to the elementName in rotation for
    // character string capturing in the foundCharacters method
    currentElement = elementName;
}

// this method is used for extracting the xml data that is stored in between the tags
// and not within individual element properties
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (parseController == false)
    {
        // parseController is set to true to prevent the NSXMLParser from a bug that's causing dual parsing
        parseController = true;
        
        // set the specific data members to the string argument, which is the characters
        // found in between the element tags since the data is stored there and not in properties of the elements
        if ([currentElement isEqualToString: @"credit"])
        {
            credit = [[NSString alloc] initWithFormat:@"Data Credited to: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"location"])
        {
            location = [[NSString alloc] initWithFormat:@"Location Reporting: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"station_id"])
        {
            station = [[NSString alloc] initWithFormat:@"Station ID: %@", string];
        }
        else if ([currentElement isEqualToString: @"latitude"])
        {
            lat = [[NSString alloc] initWithFormat:@"Latitude: %@", string];
        }
        else if ([currentElement isEqualToString: @"longitude"])
        {
            lon = [[NSString alloc] initWithFormat:@"Longitude: %@", string];
        }
        else if ([currentElement isEqualToString: @"observation_time"])
        {
            updateTime = string;
        }
        else if ([currentElement isEqualToString: @"weather"])
        {
            conditions = [[NSString alloc] initWithFormat:@"Weather: %@", string];
        }
        else if ([currentElement isEqualToString: @"temperature_string"])
        {
            temp = [[NSString alloc] initWithFormat:@"Temperature: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"relative_humidity"])
        {
            humidity = [[NSString alloc] initWithFormat:@"Humidity: %@ %%", string];
        }
        else if ([currentElement isEqualToString: @"wind_string"])
        {
            wind = [[NSString alloc] initWithFormat:@"Wind: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"windchill_string"])
        {
            windChill = [[NSString alloc] initWithFormat:@"Wind Chill: \n\n%@", string];
        }
        else if ([currentElement isEqualToString: @"pressure_string"])
        {
            pressure = [[NSString alloc] initWithFormat:@"MSL Pressure: %@", string];
        }
        else if ([currentElement isEqualToString: @"pressure_in"])
        {
            altimeter = [[NSString alloc] initWithFormat:@"Altimeter: %@ Hg", string];
        }
        else if ([currentElement isEqualToString: @"dewpoint_string"])
        {
            dewpoint = [[NSString alloc] initWithFormat:@"Dewpoint: %@", string];
        }
        else if ([currentElement isEqualToString: @"visibility_mi"])
        {
            visibility = [[NSString alloc] initWithFormat:@"Visibility: %@ miles", string];
        }
    }
}

// when a table cell is clicked the detail view will be presented with the xml data
// that is associated with that cell title
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // call the callDetailView method and pass in the appropriate xml data based on the cell row that was clicked
    switch (indexPath.row) {
        case LOCATION:
                [self callDetailView:location];
            break;
        
        case CONDITIONS:
                [self callDetailView:conditions];
            break;
            
        case TEMPERATURE:
                [self callDetailView:temp];
            break;
            
        case HUMIDITY:
                [self callDetailView:humidity];
            break;
            
        case WIND:
                [self callDetailView:wind];
            break;
            
        case WINDCHILL:
                [self callDetailView:windChill];
            break;
            
        case PRESSURE:
                [self callDetailView:pressure];
            break;
            
        case ALTIMETER:
                [self callDetailView:altimeter];
            break;
            
        case DEWPOINT:
                [self callDetailView:dewpoint];
            break;
            
        case VISIBILITY:
                [self callDetailView:visibility];
            break;
            
        case LONGITUDE:
                [self callDetailView:lon];
            break;
            
        case LATITUDE:
                [self callDetailView:lat];
            break;
            
        case STATIONID:
                [self callDetailView:station];
            break;
            
        case CREDIT:
                [self callDetailView:credit];
            break;
            
        default:
            break;
    }
}

- (void)callDetailView:(NSString *)details
{
    // create the instance of the thirdViewController
    ThirdViewController *thirdView = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    
    // pass in the appropriate data to the thirdView based on the details argument
    thirdView.text = details;
    
    // pass in the current city for the title label
    thirdView.cityText = currentCity;
    
    // present the third (detail) view
    [self presentViewController:thirdView animated:true completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return the number of objects within the listTitles array for row creation
    return [listTitles count];
}

// creates the table cells first from previously created cells, if that fails a new cell will be created for use in the table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // string cell identifier text
    static NSString *cellId = @"Cell";
    
    // attempt to create a table cell for the table within the IB based on a previously created cell with the cellId
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:cellId];
    
    // if the reuse cell creation fails create a new default cell object that can be reused with the cellId
    if (cell == nil)
    {
        // create the new reusable default cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // set the cell text
    cell.textLabel.text = [listTitles objectAtIndex:indexPath.row];
    
    return  cell;
}

- (IBAction)onClick:(id)sender
{
    // create a UITabBar item from the sender id
    UITabBarItem *item = (UITabBarItem *)sender;
    
    // if the item was created properly the click will trigger an XMLfetch based on that buttons tag
    if (item != nil)
    {
        // reset the mutableData
        requestData = nil;
        
        // set the current city
        currentCity = [cities objectAtIndex:item.tag];
        
        // fetch the xml data for the tabBarItem that was clicked
        // the items tags match their position within the weatherLocales object
        [self fetchXML:[weatherLocales objectAtIndex:item.tag]];
    }
}

// the callback from the custom delegate
- (NSString *)xmlDataString
{
    // return the XML request string to the second tab
    return requestString;
}

@end
