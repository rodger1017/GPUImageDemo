#import "ShowcaseAppDelegate.h"
#import "ShowcaseMainViewController.h"

@interface ShowcaseAppDelegate()

@end

@implementation ShowcaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    [navigationController pushViewController: [ShowcaseMainViewController new] animated: NO];
    [self.window setRootViewController: navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
