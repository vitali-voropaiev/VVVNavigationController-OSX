//
//  testView.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "ExampleView1.h"

@implementation ExampleView1

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSColor *color = _backgroundColor ? _backgroundColor : [NSColor lightGrayColor];
    [color setFill];
    NSRectFill(dirtyRect);
}

@end
