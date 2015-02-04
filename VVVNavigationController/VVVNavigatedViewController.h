//
//  VVVNavigatedViewController.h
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 27.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class VVVNavigationController;

@interface VVVNavigatedViewController : NSViewController

@property (nonatomic, weak, readonly) VVVNavigationController *navigationController;

-(void)willPresentIn:(VVVNavigationController *)navigationController;
-(void)didPresentIn:(VVVNavigationController *)navigationController;
-(void)willDismissIn:(VVVNavigationController *)navigationController;
-(void)didDismissIn:(VVVNavigationController *)navigationController;

-(void)dismissControllerAnimated:(BOOL)animated;

@end
