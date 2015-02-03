//
//  MainTestWindow.h
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 29.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainTestWindow : NSWindow

@property (nonatomic, weak) IBOutlet NSView *rightPanel;

-(void)setupDefaultWindow;

-(IBAction)test1Clicked:(id)sender;
-(IBAction)test2Clicked:(id)sender;

@end
