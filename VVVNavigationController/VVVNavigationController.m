//
//  VVVNavigationController.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "VVVNavigationController.h"
#import "VVVNavigatedViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VVVNavigationController (){
    
    CGFloat _animationDuration;
    NSMutableArray *_viewControllers;
    tVVVNavigationDirection _defaultPushDirection;
}

@end

@implementation VVVNavigationController

#pragma mark - Init Methods

-(instancetype)initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil
{
    return [self initWithFrame: NSZeroRect rootViewController: nil];
}

-(instancetype)initWithFrame:(NSRect)frame rootViewController:(VVVNavigatedViewController *)controller
{
    self = [super initWithNibName:nil bundle:nil];
    if (self){

        [self setAnimationDuration:0.25];
        [self setPushDirection:kVVVNavigationDirectionToLeft];
        _viewControllers = [NSMutableArray array];
        
        self.view = [[NSView alloc] initWithFrame:frame];
        self.view.autoresizingMask = (NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable);
        [self.view setWantsLayer:YES];
        
        if(!controller){
            controller = [[VVVNavigatedViewController alloc] init];
            controller.view = [[NSView alloc] initWithFrame:frame];
        }
        
        controller.view.autoresizingMask = self.view.autoresizingMask;
        controller.view.frame = self.view.bounds;
        
        [self pushViewController:controller animated:NO];
    }
    return self;
}

#pragma mark - Accessors

-(void)setAnimationDuration:(CGFloat)duration
{
    _animationDuration = duration;
}

-(void)setPushDirection:(tVVVNavigationDirection)direction;
{
    _defaultPushDirection = direction;
}

-(VVVNavigatedViewController *)visibleViewController
{
    return [_viewControllers lastObject];
}

-(NSArray *)controllers
{
    return [NSArray arrayWithArray:_viewControllers];
}

-(VVVNavigatedViewController *)visibleController
{
    return [_viewControllers lastObject];
}

- (CATransition *)pushTransitionWithDirection:(tVVVNavigationDirection)direction
{    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    switch (direction) {
        case kVVVNavigationDirectionToRight:
            transition.subtype = kCATransitionFromLeft;
            break;
        case kVVVNavigationDirectionToUp:
            transition.subtype = kCATransitionFromBottom;
            break;
        case kVVVNavigationDirectionToDown:
            transition.subtype = kCATransitionFromTop;
            break;
        default:
            transition.subtype = kCATransitionFromRight;
            break;
    }
    transition.duration = _animationDuration;
    return transition;
}

#pragma mark - Push / Pop Controllers

-(void)didSwapController:(VVVNavigatedViewController *)oldController with:(VVVNavigatedViewController *)newController
{
    if (oldController) {
        [oldController didDismissIn:self];
        [oldController.view removeFromSuperview];
    }
    [newController didPresentIn:self];
}

-(void)navigateFromViewController:(VVVNavigatedViewController *)currentController toController:(VVVNavigatedViewController *)targetController animated:(BOOL)animated
{
    if (currentController) {
        [currentController willDismissIn:self];
    }
    [targetController willPresentIn:self];

    targetController.view.frame = self.view.frame;
    if (animated) {
        [CATransaction begin];
        {
            [CATransaction setCompletionBlock:^{
                [self didSwapController:currentController with:targetController];
            }];
            [self.view.animator addSubview:targetController.view];
        }
        [CATransaction commit];
    }else{
        [self.view addSubview:targetController.view];
        [self didSwapController:currentController with:targetController];
    }
}

-(void)pushViewController:(VVVNavigatedViewController *)viewController animated:(BOOL)animated
{
    VVVNavigatedViewController *visibleViewcontroller = [self visibleViewController];
    [_viewControllers addObject:viewController];
    
    if (animated) {
        self.view.animations = @{@"subviews":[self pushTransitionWithDirection:_defaultPushDirection]};
    }
    
    [self navigateFromViewController:visibleViewcontroller toController:viewController animated:animated];
}

-(void)popViewControllerAnimated:(BOOL)animated
{
    if([_viewControllers count] > 1){
        VVVNavigatedViewController *visibleViewcontroller = [self visibleViewController];
        [_viewControllers removeLastObject];

        if (animated) {
            self.view.animations = @{@"subviews":[self pushTransitionWithDirection:-_defaultPushDirection]};
        }

        [self navigateFromViewController:visibleViewcontroller toController:[self visibleViewController] animated:animated];
    }
}

@end
