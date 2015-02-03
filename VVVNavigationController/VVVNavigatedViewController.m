//
//  VVVNavigatedViewController.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 27.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "VVVNavigatedViewController.h"
#import "VVVNavigationController.h"

@interface VVVNavigatedViewController ()
{
    VVVNavigationController *_navigationController;
}
@end

@implementation VVVNavigatedViewController

-(void)willPresentIn:(VVVNavigationController *)navigationController
{
    _navigationController = navigationController;
}

-(void)didPresentIn:(VVVNavigationController *)navigationController
{
    // nothing default implementation
}

-(void)willDismissIn:(VVVNavigationController *)navigationController
{
    // nothing default implementation
}

-(void)didDismissIn:(VVVNavigationController *)navigationController
{
    // nothing default implementation
}

-(void)dismissControllerAnimated:(BOOL)animated
{
    [_navigationController popViewControllerAnimated:animated];
}

@end