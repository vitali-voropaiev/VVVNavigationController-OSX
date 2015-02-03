//
//  testView.h
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface ExampleView1 : NSView

@property (nonatomic, strong) IBInspectable NSColor *backgroundColor;
@property (nonatomic, weak) IBOutlet NSTextField *text;

@end
