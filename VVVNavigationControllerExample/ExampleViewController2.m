//
//  ViewController.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "ExampleViewController2.h"
#import "ExampleView2.h"
#import "VVVNavigationController.h"

@implementation ExampleViewController2

+(instancetype)exampleController
{
    ExampleViewController2 *controller = [[ExampleViewController2 alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    NSColor *color = [NSColor colorWithCalibratedRed:(arc4random() % 255) / 255.0 green:(arc4random() % 255) / 255.0 blue:(arc4random() % 255) / 255.0 alpha: 1.0];
    [(ExampleView2 *)controller.view setBackgroundColor: color];
    
    NSButton *pushButton = ((ExampleView2 *)controller.view).pushButton;
    [pushButton setAction:@selector(pushController:)];
    [pushButton setTarget:controller];

    NSButton *popButton = ((ExampleView2 *)controller.view).popButton;
    [popButton setAction:@selector(popController:)];
    [popButton setTarget:controller];

    return controller;
}

-(void)willPresentIn:(VVVNavigationController *)navigationController
{
    [super willPresentIn:navigationController];
    NSUInteger number = [[navigationController controllers] count];
    NSString *title = (number>1) ? [NSString stringWithFormat:@"This #%ld controller", number ] : @"This root controller for test";
    [((ExampleView2 *)self.view).title setStringValue:title];
}

-(void)pushController:(id)sender
{
    ExampleViewController2 *controller = [ExampleViewController2 exampleController];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)popController:(id)sender
{
    [self dismissControllerAnimated:YES];
}

@end
