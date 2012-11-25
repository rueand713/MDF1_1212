//
//  ViewController.m
//  project1
//
//  Created by Rueben Anderson on 11/24/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "SecondViewController.h"


// typedef clarity for the buttons' tag values
typedef enum
{
    EDIT = 0,
    DONE,
    BACK
} buttonVals;

@implementation ViewController

- (void)viewDidLoad
{
    // set editing mode to false
    editingMode = NO;
    
    // hide the done button
    doneButton.hidden = YES;
    
    // an array of NSString objects to populate the tableView cells
    // the destinations array holds a NSString list of locales I would like to visit
    destinations = [[NSMutableArray alloc] initWithObjects:@"Florida", @"California", @"Canada", @"Jamaica", @"Ireland", @"England", @"New York", @"Puerto Rico", @"Hawaii", @"Nevada", @"Japan", @"Philippines", @"Germany", @"Russia", @"Brazil", @"Bahamas", @"Virgin Islands", @"Argentina", @"China", @"India", @"Italy", nil];
    
    // the priority array holds a list of NSString ratings for visiting those locales
    priority = [[NSMutableArray alloc] initWithObjects:@"8", @"9", @"7", @"10", @"8", @"4", @"6", @"7", @"7", @"5", @"8", @"10", @"3", @"1", @"9", @"8", @"7", @"6", @"3", @"4", @"2", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // returns a number based on the size of the destinations array
    // the tableView will be populated based on that value
    return [destinations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set the cell identifier string
    static NSString *cellID = @"Cell";
    
    // attemps to create a customTableCell object of a previously created tablecell
    CustomTableCell *currentCell = [myTableView dequeueReusableCellWithIdentifier:cellID];
    
    if (currentCell == nil)
    {
        // creates an array that holds all instances of the CustomTableCell view
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
        
        // loop through the views array looking for instances of view that is a customTableCell class
        for (UIView *view in views)
        {
            // checking if the view class is of type customTableCell
            if ([view isKindOfClass:[CustomTableCell class]])
            {
                // sets the currentCell object to the CustomTableCell view
                currentCell = (CustomTableCell*)view;
                
                // sets the text of the main cell label (textLabel) and the second string text (priorityLabel)
                // priorityLabel is manipulated via obj-c @property
                currentCell.textLabel.text = [destinations objectAtIndex:indexPath.row];
                currentCell.priorityLabel.text = [[NSString alloc] initWithFormat:@"Rating: %@/10", [priority objectAtIndex:indexPath.row]];
                
            }
        }
    }
    
    return currentCell;
}

// method for returning the type of editingStyle of the tableView
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // return a editing style for item deletion
    return UITableViewCellEditingStyleDelete;
}

// method that fires when a table cell has been selected
// once it fires the secondView is called up and the cell data is applied to it for display
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *showDetails = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];

    if (showDetails != nil)
    {
        // store the currently selected cell name and row in an NSArray for passing to the second view
        NSArray *detailData = [[NSArray alloc] initWithObjects:[destinations objectAtIndex:indexPath.row], indexPath, nil];
        
        // pass the selected row and name string into the second view
        showDetails.receiver = detailData;
        
        // present the second view
        [self presentViewController:showDetails animated:YES completion:nil];
    }
}

// handles the click events for the done and edit buttons
- (IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        switch (button.tag) {
            case EDIT:
                // set the table into editing mode
                [myTableView setEditing:true];
                
                // hide the edit button and reveal the done button
                editButton.hidden = YES;
                doneButton.hidden = NO;
                break;
                
            case DONE:
                // set the table into editing mode
                [myTableView setEditing:false];
                
                // hide the edit button and reveal the done button
                editButton.hidden = NO;
                doneButton.hidden = YES;
                break;
                
            default:
                break;
        }
    }
}

// method for committing the delete functionality of the table cells
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // an array of rows to delete
        NSArray *rowsToDelete = [NSArray arrayWithObject:indexPath];
        
        // removes the current index of indexPath.row for the destinations and priority objects
        [destinations removeObjectAtIndex:indexPath.row];
        [priority removeObjectAtIndex:indexPath.row];
        
        // delete the row(s) in the rowsToDelete array
        [myTableView deleteRowsAtIndexPaths:rowsToDelete withRowAnimation:true];
    }
}

@end
