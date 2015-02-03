//
//  testView.h
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ExampleView2 : NSView

@property (nonatomic, strong) NSColor *backgroundColor;
@property (nonatomic,weak) IBOutlet NSTextField *title;
@property (nonatomic,weak) IBOutlet NSButton *pushButton;
@property (nonatomic,weak) IBOutlet NSButton *popButton;

@end
