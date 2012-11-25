//
//  ViewController.m
//  customTableCellTest
//
//  Created by Rueben Anderson on 11/23/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    titles = [[NSMutableArray alloc] initWithObjects:@"How High", @"Billy Madison", @"The Matrix", @"The Patriot", @"Outlander", nil];

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
    static NSString *cellID = @"Cell";
    
    CustomTableView *cell = [myTableView dequeueReusableCellWithIdentifier:cellID];
    
    // An array of customCellView objects
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:nil options:nil];
    
    for (UIView *view in views)
    {
        // check if view is a CustomTableCell class
        if ([view isKindOfClass:[CustomTableView class]])
        {
            // currentCell is set to view casted to CustomTableCell class
            cell = (CustomTableView*)view;
            
            // set the label text to the text in the current row of the array
            cell.textLabel.text = [titles objectAtIndex:indexPath.row];
        }
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [titles count];
}

@end
