#import <UIKit/UIKit.h>

@interface TransitionController : UIViewController

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIViewController *viewController;

- (id)initWithViewController:(UIViewController *)viewController;
- (void)transitionToViewController:(UIViewController *)viewController
                       withOptions:(UIViewAnimationOptions)options;
@end
