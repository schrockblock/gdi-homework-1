//
//  AppDelegate.m
//  ContactViewer
//
//  Created by Elliot Schrock on 6/7/15.
//  Copyright (c) 2015 Elliot Schrock. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ContactTableViewController alloc] initWithNibName:@"ContactTableViewController" bundle:nil]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
