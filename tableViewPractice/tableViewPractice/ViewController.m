//
//  ViewController.m
//  tableViewPractice
//
//  Created by Rueben Anderson on 11/20/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    itemsArr = [[NSArray alloc] initWithObjects:@"GoldenEye 007", @"Perfect Dark", @"Conquer", @"Battlefield 1942", @"Halo", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create a string for referencing
    static NSString *cellID = @"cell";
    
    // create the UITableView object from reference
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        // if the UITableView object is nil no previous object was referenced so create one
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        // set the cell label text to the text in the array at the current row
        cell.textLabel.text = (NSString*)[itemsArr objectAtIndex:indexPath.row];

    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [itemsArr count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row %d is selected.", indexPath.row);
}

@end
