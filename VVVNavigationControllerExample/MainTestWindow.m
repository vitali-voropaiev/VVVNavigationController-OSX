//
//  MainTestWindow.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 29.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "MainTestWindow.h"
#import "VVVNavigationController.h"
#import "ExampleViewController1.h"
#import "ExampleViewController2.h"

@interface MainTestWindow ()
{
    VVVNavigationController *_navigationController;
    NSUInteger _testNumber;
}

@end

@implementation MainTestWindow

#pragma mark - Init

-(instancetype)init
{
    self = [super init];
    _testNumber = 0;
    return self;
}

#pragma mark - Accessors

-(NSRect)frameForRightPanel
{
    NSSize frameSize = _rightPanel.frame.size;
    return (NSRect){CGPointZero,frameSize};
}


-(void)setupDefaultWindow
{
    NSRect frame = _rightPanel.frame;
    ExampleViewController1 *controller = [ExampleViewController1 exampleController];
    _navigationController = [[VVVNavigationController alloc] initWithFrame:(NSRect){CGPointZero, frame.size} rootViewController:controller];
    [_navigationController setPushDirection:kVVVNavigationDirectionToUp];
    [_rightPanel addSubview:_navigationController.view];
}

-(void)addTest1Controller
{
    ExampleViewController2 *controller = [ExampleViewController2 exampleController];
    VVVNavigationController *navigationController = [[VVVNavigationController alloc] initWithFrame:[self frameForRightPanel] rootViewController:controller];
    [_navigationController pushViewController:navigationController animated:YES];
}

-(void)addTest2Controller
{
//    ExampleViewController1 *controller = [ExampleViewController1 exampleController];
//    [_navigationController pushViewController:controller animated:YES];

    ExampleViewController2 *controller = [ExampleViewController2 exampleController];
    VVVNavigationController *navigationController = [[VVVNavigationController alloc] initWithFrame:[self frameForRightPanel] rootViewController:controller];
    [_navigationController pushViewController:navigationController animated:YES];
}

#pragma mark - Actions

-(IBAction)test1Clicked:(id)sender
{
    NSUInteger count = [[_navigationController controllers] count];
    if (_testNumber != 1){
        _testNumber = 1;
        if (count<3) {
            [self addTest1Controller];
        }else{
            [[_navigationController visibleController] dismissControllerAnimated:YES];
        }
    }
}

-(IBAction)test2Clicked:(id)sender
{
    NSUInteger count = [[_navigationController controllers] count];
    if (_testNumber != 2){
        _testNumber = 2;
        if (count<3) {
            [self addTest2Controller];
        }else{
            [[_navigationController visibleController] dismissControllerAnimated:YES];
        }
    }
}
@end
