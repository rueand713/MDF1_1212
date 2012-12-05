//
//  AppDelegate.h
//  practiceTabApp
//
//  Created by Rueben Anderson on 11/27/12.
//  Copyright (c) 2012 Rueben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
