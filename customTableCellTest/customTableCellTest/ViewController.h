//
//  ViewController.h
//  customTableCellTest
//
//  Created by Rueben Anderson on 11/23/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *titles;
}
@end
