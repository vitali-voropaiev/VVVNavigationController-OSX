//
//  AppDelegate.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTestWindow.h"

@interface AppDelegate ()

@property (weak) IBOutlet MainTestWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [_window setupDefaultWindow];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
