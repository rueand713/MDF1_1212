//
//  SecondViewController.m
//  project1
//
//  Created by Rueben Anderson on 11/24/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import "SecondViewController.h"

// typedef of the 20 list items for use in my switch statement
// typedef for ease of use and clarity
typedef enum {
    FLORIDA = 0,
    CALIFORNIA,
    CANADA,
    JAMAICA,
    IRELAND,
    ENGLAND,
    NEWYORK,
    PUERTORICO,
    HAWAII,
    NEVADA,
    JAPAN,
    PHILIPPINES,
    GERMANY,
    RUSSIA,
    BRAZIL,
    BAHAMAS,
    VIRGINISLANDS,
    ARGENTINA,
    CHINA,
    INDIA,
    ITALY
} locales;

@implementation SecondViewController

@synthesize receiver;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{   // set temp variables to hold the receiver object's passed in values
    NSString *name = [receiver objectAtIndex:0];
    NSIndexPath *index = [receiver objectAtIndex:1];
    
    // call the updateDetails method and pass in the temp variables as arguments
    [self updateDetails:index destination:name];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// this method takes the passed in NSIndexPath and NSString from the ViewController and outputs the data
// to the SecondViewController for display
- (void)updateDetails:(NSIndexPath *)index destination:(NSString *)destination
{
    // sets the title text to the passed in destination string
    titleLabel.text = destination;
    
    // switch betweent the cases based on the NSIndexPath's row with each row corresponding to a specific enum
    // updates the UITextView text to reflect info on the tablecell clicked
    switch (index.row) {
        case FLORIDA:
            detailtext.text = @"Population: 19,057,542 (2011 est)\n\nComments: Warm weather and hundreds of miles of beaches attract about 60 million visitors to the state every year.";
            break;
        
        case CALIFORNIA:
            detailtext.text = @"Population: 37,691,912 (2011 est)\n\nComments: California is responsible for 13 percent of the United States' gross domestic product (GDP). As of 2010, California's GDP is larger than all but eight countries in the world.";
            break;
            
        case CANADA:
            detailtext.text = @"Population: 33,476,688 (2011)\n\nComments: Canada has around 31,700 large lakes, more than any other country, containing much of the world's fresh water.";
            break;
            
        case JAMAICA:
            detailtext.text = @"Population: 2,889,187 (2012 est)\n\nComments: The Jamaican animal life, typical of the Caribbean, includes highly diversified wildlife with many endemic species found nowhere else on earth. As with other oceanic islands, land mammals are made up almost entirely of Bats.";
            break;
            
        case IRELAND:
           detailtext.text = @"Population: 6,399,152 (2011)\n\nComments: Some of the most visited sites in Ireland include Bunratty Castle, the Rock of Cashel, the Cliffs of Moher, Holy Cross Abbey and Blarney Castle. Historically important monastic sites include Glendalough and Clonmacnoise, which are maintained as national monuments in the Republic of Ireland.";
            break;
            
        case ENGLAND:
           detailtext.text = @"Population: 53,013,000 (2011)\n\nComments: England has a temperate maritime climate: it is mild with temperatures not much lower than 32 °F in winter and not much higher than 90 °F in summer. The weather is damp relatively frequently and is changeable. The coldest months are January and February, the latter particularly on the English coast, while July is normally the warmest month.";
            break;
            
        case NEWYORK:
           detailtext.text = @"Population: 19,465,197 (2011 est)\n\nComments: New York covers 54,556 square miles (141,300 km2) and ranks as the 27th largest state by size. The Great Appalachian Valley dominates eastern New York, while Lake Champlain is the chief northern feature of the valley, which also includes the Hudson River flowing southward to the Atlantic Ocean. The rugged Adirondack Mountains, with vast tracts of wilderness, lie west of the valley.";
            break;
            
        case PUERTORICO:
           detailtext.text = @"Population: 3,706,690 (2011 est)\n\nComments: Much of Puerto Rican culture centers on the influence of music. Like the country as a whole, Puerto Rican music has been developed by mixing other cultures with local and traditional rhythms. Early in the history of Puerto Rican music, the influences of African and Spanish traditions were most noticeable.";
            break;
            
        case HAWAII:
            detailtext.text = @"Population: 1,374,810 (2011 est)\n\nComments: All the Hawaiian islands were formed from volcanic activity initiated at an undersea magma source called a hotspot. As the tectonic plate beneath much of the Pacific Ocean moves to the northwest, the hot spot remains stationary, slowly creating new volcanoes.";
            break;
        
        case NEVADA:
            detailtext.text = @"Population: 2,723,322 (2011 est)\n\nComments: Nevada is the driest state in the United States. It is made up of mostly desert and semiarid climate regions, daytime summer temperatures sometimes may rise as high as 125 °F and nighttime winter temperatures may reach as low as −50 °F.";
            break;
            
        case JAPAN:
            detailtext.text = @"Population: 126,659,683 (2012 est)\n\nComments: Japanese culture has evolved greatly from its origins. Contemporary culture combines influences from Asia, Europe and North America. Traditional Japanese arts include crafts such as ceramics, textiles, lacquerware, swords and dolls.";
            break;
            
        case PHILIPPINES:
            detailtext.text = @"Population: 92,337,852 (2010 est)\n\nComments: The Philippines' rainforests and its extensive coastlines make it home to a diverse range of birds, plants, animals, and sea creatures.[87] It is one of the ten most biologically megadiverse countries and is at or near the top in terms of biodiversity per unit area.";
            break;
            
        case GERMANY:
            detailtext.text = @"Population: 81,799,600 (2010 est)\n\nComments: Germany has a social market economy with a highly skilled labour force, a large capital stock, a low level of corruption, and a high level of innovation. It has the largest and most powerful national economy in Europe, the fourth largest by nominal GDP in the world.";
            break;
            
        case RUSSIA:
            detailtext.text = @"Population: 143,300,000 (2012 est)\n\nComments: Most of Russia consists of vast stretches of plains that are predominantly steppe to the south and heavily forested to the north, with tundra along the northern coast. Russia possesses 10% of the world's arable land.";
            break;
            
        case BRAZIL:
           detailtext.text = @"Population: 193,946,886 (2012 est)\n\nComments: An equatorial climate characterizes much of northern Brazil. There is no real dry season, but there are some variations in the period of the year when most rain falls. Temperatures average 77 °F, with more significant temperature variation between night and day than between seasons.";
            break;
            
        case BAHAMAS:
            detailtext.text = @"Population: 353,658 (2010 est)\n\nComments: One of the most prosperous countries in the Caribbean region, The Bahamas relies on tourism to generate most of its economic activity. Tourism as an industry not only accounts for over 60 percent of the Bahamian GDP, but provides jobs for more than half the country's workforce.";
            break;
            
        case VIRGINISLANDS:
            detailtext.text = @"Population: 109,750 (2010 est)\n\nComments: The U.S. Virgin Islands are in the Caribbean Sea and the Atlantic Ocean, about 40 miles (64 km) east of Puerto Rico and immediately west of the British Virgin Islands. The territory consists of four main islands: Saint Thomas, Saint John, Saint Croix, and Water Island, as well as several dozen smaller islands.";
            break;
            
        case ARGENTINA:
            detailtext.text = @"Population: 41,281,631 (2012 est)\n\nComments: The generally temperate climate ranges from subtropical in the north to subpolar in the far south. The north is characterized by very hot, humid summers with mild drier winters, and is subject to periodic droughts.";
            break;
        
        case CHINA:
           detailtext.text = @"Population: 1,347,350,000 (2011 est)\n\nComments: As of 2012, China has the world's second-largest economy in terms of nominal GDP, totalling approximately US$7.298 trillion according to the International Monetary Fund. However, China's 2011 nominal GDP per capita of US$5,413 puts it behind around ninety countries in global GDP per capita rankings.";
            break;
            
        case INDIA:
            detailtext.text = @"Population: 1,210,193,422 (2011)\n\nComments: India lies within the Indomalaya ecozone and contains three biodiversity hotspots. One of 17 megadiverse countries, it hosts 8.6% of all mammalian, 13.7% of all avian, 7.9% of all reptilian, 6% of all amphibian, 12.2% of all piscine, and 6.0% of all flowering plant species. Endemism is high among plants, 33%, and among ecoregions such as the shola forests.";
            break;
            
        case ITALY:
           detailtext.text = @"Population: 60,813,326 (2011 est)\n\nComments: The country is situated at the meeting point of the Eurasian Plate and the African Plate, leading to considerable seismic and volcanic activity. There are 14 volcanoes in Italy, four of which are active: Etna, Stromboli, Vulcano and Vesuvius.";
            break;
            
        default:
            break;
    }
}

// receives sender id and cast to a UIButton
// if the button is created properly (the sender id belonged to a UIButton) the current view is dismissed
- (IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    if (button != nil)
    {
        // dismiss the current view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
