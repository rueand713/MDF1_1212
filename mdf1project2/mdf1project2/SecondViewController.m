//
//  SecondViewController.m
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "SecondViewController.h"

typedef  enum {
    REST = 0,
    REPRESENTATION,
    URI,
    RESOURCES
//    URL
} cellLabels;

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // set the title of the second tab to 'Research'
        self.title = NSLocalizedString(@"Research", @"Second");
        
        // set the second tab image
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // initialize the cellLabels array with NSString objects
    // the objects are subtopics
    subTopics = [[NSArray alloc] initWithObjects:@"What is REST?", @"Representation", @"What is the URI?", @"Resources", nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    // capture the default position of the detail view
    originalFrame = detailView.frame;
    
    // move the detail view off the screen
    detailView.frame = CGRectMake(320.0f, 0.0f, detailView.frame.size.width, detailView.frame.size.height);
    
    [super viewDidAppear:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // returns the number of rows in the table
    // based on the number of objects within the subTopics array
    return [subTopics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    
    // try to create a cell from a previous with cellID
    UITableViewCell *cell = [myTable dequeueReusableCellWithIdentifier:cellID];
    
    // no previous cell found
    if (cell == nil)
    {
        // create a new reuseable cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        // set the cell text label
        cell.textLabel.text = [subTopics objectAtIndex:indexPath.row];
    }
    
    // return a reused cell or new cell
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // sets the detail view textView text based on the
    // selected row in the tableView
    if (indexPath.row == REST)
    {
        titleLabel.text = @"What is REST?";
        detailText.text = @"The term REST comes from Roy Fielding's PhD dissertation, published in 2000, and it stands for REpresentational State Transfer. REST by itself is not an architecture; REST is a set of constraints that when applied to the design of a system, creates a software architecture style.\nURL: http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=334486&site=ehost-live&ebv=1&ppid=pp_7";
    }
    else if (indexPath.row == REPRESENTATION)
    {
        titleLabel.text = @"Representation";
        detailText.text = @"A representation is a temporal state of the actual data located in some storage device at the time of a request. In general terms, it's a binary stream together with its metadata that describes how the stream is to be consumed by either the client or the server.\nThroughout the life of a web service there may be a variety of clients requesting resources. Different clients are able to consume different representations of the same resource. Therefore, a representation can take various forms, such as an image, a text file, or an XML stream or a JSON stream, but has to be available through the URI.\nURL: http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=334486&site=ehost-live&ebv=1&ppid=pp_10";
    }
    else if (indexPath.row == URI)
    {
        titleLabel.text = @"What is the URI?";
        detailText.text = @"A Uniform Resource Identifier, or URI, in a RESTful web service is a hyperlink to a resource, and it's the only means for clients and servers to exchange representations.\nURL: http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=334486&site=ehost-live&ebv=1&ppid=pp_10";
    }
    else if (indexPath.row == RESOURCES)
    {
        titleLabel.text = @"Resources";
        detailText.text = @"A RESTful resource is anything that is addressable over the Web. By Addressable we mean resources that can be accessed and transferred between clients and servers. Subsequently, a resource is a logical, temporal mapping to a concept in the problem domain for which we are implementing a solution.\nURL: http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=334486&site=ehost-live&ebv=1&ppid=pp_9";
    }
    /*else if (indexPath.row == URL)
    {   // INDEX REMOVED
        titleLabel.text = @"Database";
        detailText.text = @"Book: RESTful Java Web Services\n\nURL:http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=334486&site=ehost-live\n\nComments: All information has been taken from Chapter 1, which is about the core of RESTful web services.";
    }*/
    
    // once the detail text has been set the animation to the view is set in motion!
    
    // begin the UI animation
    [UIView beginAnimations:nil context:nil];
    
    // show the detail view
    detailView.frame = originalFrame;
    
    // end animation block
    [UIView commitAnimations];
}

- (IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    if (button != nil)
    {
        // begin the UI animation
        [UIView beginAnimations:nil context:nil];
        
        // show the detail view
        detailView.frame = CGRectMake(320.0f, 0.0f, detailView.frame.size.width, detailView.frame.size.height);
        
        // end animation block
        [UIView commitAnimations];
    }
}

@end
