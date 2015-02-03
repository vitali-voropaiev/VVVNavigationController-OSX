#VVVNavigationController

Provide navigation to a stack of view controllers.

##Usage

###Init a navigation controller

    // store frame of superview
    NSRect frame = superview.frame;

    // init navigation controller with empty root view controller
    VVVNavigationController *navigationController = [[VVVNavigationController alloc] initWithFrame:(NSRect){CGPointZero, frame.size} rootViewController:nil];

    // set direction for push animation
    [navigationController setPushDirection:kVVVNavigationDirectionToLeft];

    // add navigation controller view to superview
    [superview addSubview:navigationController.view];

You can init VVVNavigationController instance with custom view controller

    CustomViewController *controller = [CustomViewController customController];
    VVVNavigationController *navigationController = [[VVVNavigationController alloc] initWithFrame:superviewFrame rootViewController:controller];
    [navigationController setPushDirection:kVVVNavigationDirectionToUp];
    [superView addSubview:navigationController.view];

###Pushing a view controller

    [navigationControllerInstance pushViewController:pushedViewController animated:YES];

**Note:** pushed view controllers must be subclass of the VVVNavigatedViewController

###Pop the top (visible) view controller

    // inside a subclass of VVVNavigatedViewController
    [self popViewControllerAnimated:YES];

###Push animation

Push view controller with animation

    [navigationControllerInstance pushViewController:pushedViewController animated:YES];

Push view controller without animation

    [navigationControllerInstance pushViewController:pushedViewController animated:NO];

###Animation direction

You can set direction for push/pop animation

    [navigationControllerInstance setPushDirection:kVVVNavigationDirectionToLeft];

All available 4 keys of type **tVVVNavigationDirection**:

    kVVVNavigationDirectionToUp,
    kVVVNavigationDirectionToLeft,  // default
    kVVVNavigationDirectionToRight,
    kVVVNavigationDirectionToDown,


##VVVNavigatedViewController

VVVNavigatedViewController is an abstract class, subclassed from NSViewController.
 
In this class added 4 methods that can be overrided for receive the navigation event:

    // sent before start push animation 
    -(void)willPresentIn:(VVVNavigationController *)navigationController;
    
    // sent after end push animation
    -(void)didPresentIn:(VVVNavigationController *)navigationController;

    // sent before start pop animation 
    -(void)willDismissIn:(VVVNavigationController *)navigationController;

    // sent after end pop animation
    -(void)didDismissIn:(VVVNavigationController *)navigationController;

**Important:** If you override method **willPresentIn:** you must call **[super willPresentIn:]**

**Example:**

    -(void)willPresentIn:(VVVNavigationController *)navigationController
    {
        [super willPresentIn:navigationController]; // !!!
        [((ExampleView2 *)self.view).title setStringValue:@"Title"];
    }

