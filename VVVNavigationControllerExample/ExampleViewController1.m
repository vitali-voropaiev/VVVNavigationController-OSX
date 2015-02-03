//
//  ViewController.m
//  VVVNavigationControllerExample
//
//  Created by Voropaev Vitali on 26.01.15.
//  Copyright (c) 2015 Voropaev Vitali. All rights reserved.
//

#import "ExampleViewController1.h"
#import "ExampleView1.h"
#import "VVVNavigationController.h"

@implementation ExampleViewController1

+(instancetype)exampleController
{
    ExampleViewController1 *controller = [[ExampleViewController1 alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    [[(ExampleView1 *)controller.view text] setStringValue:@"Press button 1 or 2 for test"];
    
    return controller;
}

-(void)pushController:(id)sender
{
    ExampleViewController1 *controller = [ExampleViewController1 exampleController];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)popController:(id)sender
{
    [self dismissControllerAnimated:YES];
}

@end
