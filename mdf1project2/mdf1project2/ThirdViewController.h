//
//  ThirdViewController.h
//  mdf1project2
//
//  Created by Rueben Anderson on 11/28/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIImageView *imageView;
    IBOutlet UIScrollView *scrollView;
    UIImage *origImage;
}

@end
