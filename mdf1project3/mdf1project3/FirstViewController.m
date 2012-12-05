//
//  FirstViewController.m
//  mdf1project3
//
//  Created by Rueben Anderson on 12/4/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "FirstViewController.h"
#import "ThirdViewController.h"

#define DONE 1
#define EDIT 0

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        // create a mutable array of the business locations
        businessLocations = [[NSMutableArray alloc] initWithObjects:@"Houston, TX", @"Dallas, TX", @"Orlando, FL", @"Miami, FL", @"Los Angeles, CA", @"Sacremento, CA", @"New York City, NY", @"Seattle, WA", @"Chicago, IL", @"Las Vegas, NV", nil];
        
        // create a mutable array of the business names at the specific index of the locations array
        businesses = [[NSMutableArray alloc] initWithObjects:@"Aztech Designs", @"MoonSoft", @"Magic Paintballers", @"Beach Bowling", @"Crazy Ink", @"Anise's Flowers", @"Gambino's Pizza", @"Cozy Lodge Inn", @"Ronald's Tires", @"Ko Casino Resort", nil];
        
        // duplicate the data in an unmutable format
        masterBusinessRecord = [[NSArray alloc] initWithObjects:@"Aztech Designs", @"MoonSoft", @"Magic Paintballers", @"Beach Bowling", @"Crazy Ink", @"Anise's Flowers", @"Gambino's Pizza", @"Cozy Lodge Inn", @"Ronald's Tires", @"Ko Casino Resort", nil];
        
        // create an NSNumber object for each city's business latitude and longitude
        NSNumber *houstonLat = [[NSNumber alloc] initWithFloat:29.7631f];
        NSNumber *houstonLon = [[NSNumber alloc] initWithFloat:-95.3631f];
        NSNumber *dallasLat = [[NSNumber alloc] initWithFloat:32.8029550f];
        NSNumber *dallasLon = [[NSNumber alloc] initWithFloat:-96.7699230f];
        NSNumber *orlandoLat = [[NSNumber alloc] initWithFloat:28.5383355f];
        NSNumber *orlandoLon = [[NSNumber alloc] initWithFloat:-81.3792365f];
        NSNumber *miamiLat = [[NSNumber alloc] initWithFloat:25.7742657f];
        NSNumber *miamiLon = [[NSNumber alloc] initWithFloat:-80.1936589f];
        NSNumber *losangelesLat = [[NSNumber alloc] initWithFloat:34.0522342f];
        NSNumber *losangelesLon = [[NSNumber alloc] initWithFloat:-118.2436849f];
        NSNumber *sacrementoLat = [[NSNumber alloc] initWithFloat:38.5815719f];
        NSNumber *sacrementoLon = [[NSNumber alloc] initWithFloat:-121.4943996f];
        NSNumber *newyorkLat = [[NSNumber alloc] initWithFloat:40.7142691f];
        NSNumber *newyorkLon = [[NSNumber alloc] initWithFloat:-74.0059729f];
        NSNumber *seattleLat = [[NSNumber alloc] initWithFloat:47.6062095f];
        NSNumber *seattleLon = [[NSNumber alloc] initWithFloat:-122.3320708f];
        NSNumber *chicagoLat = [[NSNumber alloc] initWithFloat:41.8500330f];
        NSNumber *chicagoLon = [[NSNumber alloc] initWithFloat:-87.6500523f];
        NSNumber *lasvegasLat = [[NSNumber alloc] initWithFloat:36.1146460f];
        NSNumber *lasvegasLon = [[NSNumber alloc] initWithFloat:-115.1728160f];
        
        // create an array to house both NSNumber coordinates for each city/business
        NSArray *houston = [[NSArray alloc] initWithObjects:houstonLat, houstonLon, nil];
        NSArray *dallas = [[NSArray alloc] initWithObjects:dallasLat, dallasLon, nil];
        NSArray *orlando = [[NSArray alloc] initWithObjects:orlandoLat, orlandoLon, nil];
        NSArray *miami = [[NSArray alloc] initWithObjects:miamiLat, miamiLon, nil];
        NSArray *losangeles = [[NSArray alloc] initWithObjects:losangelesLat, losangelesLon, nil];
        NSArray *sacremento = [[NSArray alloc] initWithObjects:sacrementoLat, sacrementoLon, nil];
        NSArray *newyork = [[NSArray alloc] initWithObjects:newyorkLat, newyorkLon, nil];
        NSArray *seattle = [[NSArray alloc] initWithObjects:seattleLat, seattleLon, nil];
        NSArray *chicago = [[NSArray alloc] initWithObjects:chicagoLat, chicagoLon, nil];
        NSArray *lasvegas = [[NSArray alloc] initWithObjects:lasvegasLat, lasvegasLon, nil];
        
        // create a mutable array of the business locations lat and lon values array
        businessCoords = [[NSMutableArray alloc] initWithObjects:houston, dallas, orlando, miami, losangeles, sacremento, newyork, seattle, chicago, lasvegas, nil];
        
        // set the masterCoordinate array (this will always retain all of the coordinates)
        masterCoordRecord = [[NSArray alloc] initWithObjects:houston, dallas, orlando, miami, losangeles, sacremento, newyork, seattle, chicago, lasvegas, nil];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // hide the done button
    doneButton.hidden = YES;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // fetch the stored NSNumber values for the latitude and longitude from within the businessCords array of arrays
    NSNumber *lat = [[businessCoords objectAtIndex:indexPath.row] objectAtIndex:0];
    NSNumber *lon = [[businessCoords objectAtIndex:indexPath.row] objectAtIndex:1];
  //  NSLog(@"Lat:%f, Lon:%f", [lat floatValue], [lon floatValue]);
    // creates an NSString to hold the business name and location strings
    NSString *locTitle = [businesses objectAtIndex:indexPath.row];
    NSString *businessLoc = [businessLocations objectAtIndex:indexPath.row];
    
    // create an instance of the thirdView
    ThirdViewController *selectedLocationView = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    
    // pass the newly defined lat and lon values into the third view
    selectedLocationView.latitude = [lat floatValue];
    selectedLocationView.longitude = [lon floatValue];
    
    // pass the location and business name into the third view
    selectedLocationView.nameText = locTitle;
    selectedLocationView.locText = businessLoc;
    
    // present the thirdView
    [self presentViewController:selectedLocationView animated:true completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return the number of items in the locations array object
    return [businesses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
    // try to create a reused cell
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:cellID];
    
    // if the reused cell creation fails make a new cell
    if (cell == nil)
    {
        // create the new default styled cell and set its reuseid
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    // set the label text based on the locations array
    cell.textLabel.text = [businesses objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // remove the row from the business name, city and location arrays
        [businesses removeObjectAtIndex: indexPath.row];
        [businessLocations removeObjectAtIndex:indexPath.row];
        [businessCoords removeObjectAtIndex:indexPath.row];
        
        // remove the cell row from the tableView
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

// the handler for the edit and done button
// the edit button sets the tableView into editing mode, shows the done button and hides the edit button
// the done button takes the tableView out of editing mode, shows the edit button and hides the done button
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton *)sender;

    if (button != nil)
    {
        if (button.tag == DONE)
        {
            // hide the done button unhide the editbutton
            doneButton.hidden = YES;
            editButton.hidden = NO;
            
            // set the table into editing mode
            [myTableView setEditing:false];
        }
        else if (button.tag == EDIT)
        {
            // hide the edit button and unhide the done button
            doneButton.hidden = NO;
            editButton.hidden = YES;
            
            // set the table into editing mode
            [myTableView setEditing:true];
        }
    }
}

// this is a callback method for the second tabbed view
// it will return the map data needed to create all of the map annotations
-(NSArray *)retrieveCoordList
{
    // create an array to house the coordinates and business name arrays
    NSArray *mapDetails = [[NSArray alloc] initWithObjects:masterCoordRecord, masterBusinessRecord, nil];
    
    // return the map data to the second View
    return mapDetails;
}

@end
