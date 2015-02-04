//
//  VVVNavigatorControllerTests.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 03.02.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "VVVNavigatedViewController.h"
#import "VVVNavigationController.h"

@interface VVVNavigatedControllerTests : XCTestCase
{
    VVVNavigatedViewController  *_navigatedController;
    VVVNavigationController     *_navigationController;
}
@end

@implementation VVVNavigatedControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSRect frame = (NSRect){CGPointZero, {640.0, 320.0}};
    _navigatedController = [[VVVNavigatedViewController alloc] initWithNibName:nil bundle:nil];
    _navigatedController.view = [[NSView alloc] initWithFrame:frame];
    
    _navigationController = [[VVVNavigationController alloc] initWithFrame:frame rootViewController:nil];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testInitController
{
    XCTAssertNotNil(_navigatedController, @"Navigated controller not initialised...");
}

-(void)testEventsMethod
{
    BOOL willPresentMethod = [_navigatedController respondsToSelector:@selector(willPresentIn:)];
    XCTAssert(willPresentMethod, @"Navigated controller not responds to selector 'willPresentIn:'");
    
    BOOL didPresentMethod = [_navigatedController respondsToSelector:@selector(didPresentIn:)];
    XCTAssert(didPresentMethod, @"Navigated controller not responds to selector 'didPresentIn:'");
    
    BOOL willDismissMethod = [_navigatedController respondsToSelector:@selector(willDismissIn:)];
    XCTAssert(willDismissMethod, @"Navigated controller not responds to selector 'willDismissIn:'");
    
    BOOL didDismissMethod = [_navigatedController respondsToSelector:@selector(didDismissIn:)];
    XCTAssert(didDismissMethod, @"Navigated controller not responds to selector 'didDismissIn:'");
    
    BOOL dismissControllerMethod = [_navigatedController respondsToSelector:@selector(dismissControllerAnimated:)];
    XCTAssert(dismissControllerMethod, @"Navigated controller not responds to selector 'dismissControllerAnimated:'");
}

-(void)testPushController
{
    [_navigationController pushViewController:_navigatedController animated:YES];
    
    XCTAssertNotNil(_navigatedController.navigationController, @"Parent navigation controller is not set");
    XCTAssertEqualObjects(_navigationController, _navigatedController.navigationController, @"Parent navigation controller for navigated controller is invalid");
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
