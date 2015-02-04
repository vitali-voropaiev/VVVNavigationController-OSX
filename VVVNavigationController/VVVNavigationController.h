//
//  VVVNavigationController.h
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VVVNavigatedViewController.h"


typedef NS_OPTIONS(NSUInteger, tVVVNavigationDirection)
{
    kVVVNavigationDirectionToUp     = -2,
    kVVVNavigationDirectionToLeft   = -1,
    kVVVNavigationDirectionToRight  =  1,
    kVVVNavigationDirectionToDown   =  2,
};

#pragma mark - Interface

/**
 * VVVNavigationController can be pushed/popped VVVNavigatedViewControllers with/without animated transitions.
 */
@interface VVVNavigationController : VVVNavigatedViewController

/**
 *  Initializer
 *
 *  @return instance of VVVNavigationController
 */
-(instancetype)initWithFrame:(NSRect)frame rootViewController:(NSViewController *)controller;

/**
 *  Set default push direction
 *
 */
-(void)setPushDirection:(tVVVNavigationDirection)direction;

/**
 *
 *  @return Returns an array containing the view controllers currently on the stack
 */
-(NSArray *)controllers;

/**
 *
 *  @return Returns the last in stack view controller
 */
-(VVVNavigatedViewController *)visibleController;

/**
 *  Push viewController to self view with/without animation
 *
 */
-(void)pushViewController:(VVVNavigatedViewController *)viewController animated:(BOOL)animated;

/**
 *  Pop curent (visible) view controller with/without animation
 *
 */
-(void)popViewControllerAnimated:(BOOL)animated;

@end
