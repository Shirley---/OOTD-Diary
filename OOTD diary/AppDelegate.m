#import "AppDelegate.h"

#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    MainViewController *mainView = [[MainViewController alloc]init]; //Allocate the View Controller
    
    self.window.rootViewController = mainView;   //Set the view controller
    [self.window makeKeyAndVisible];
    return YES;
}

@end
