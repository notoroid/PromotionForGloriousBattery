//
//  FadeInTransition.m
//  PromotionForGloriousBattery
//
//  Created by 能登 要 on 2015/12/31.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import "FadeInTransition.h"

@implementation FadeInTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    toView.alpha = .0f;
    [UIView animateWithDuration:1.5
                     animations:^{
                         toView.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){
                         BOOL completed = ![transitionContext transitionWasCancelled];
                         [transitionContext completeTransition:completed];
                     }
     ];
    
}

@end
