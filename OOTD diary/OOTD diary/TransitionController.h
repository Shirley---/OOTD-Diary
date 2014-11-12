//
//  TransitionController.h
//  OOTD diary
//
//  Created by Shirley Du on 2014-11-08.
//  Copyright (c) 2014 Shirley Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionController : UIViewController

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIViewController *viewController;

- (id)initWithViewController:(UIViewController *)viewController;
- (void)transitionToViewController:(UIViewController *)viewController
                       withOptions:(UIViewAnimationOptions)options;
@end
