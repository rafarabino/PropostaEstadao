//
//  ESTAppDelegate.m
//  Estadao
//
//  Created by Natan Rolnik on 19/05/14.
//  Copyright (c) 2014 natanrolnik. All rights reserved.
//

#import "ESTAppDelegate.h"
#import <COSTouchVisualizerWindow.h>

@implementation ESTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (COSTouchVisualizerWindow *)window
{
    static COSTouchVisualizerWindow *customWindow = nil;
    if (!customWindow) customWindow = [[COSTouchVisualizerWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    return customWindow;
}

@end
