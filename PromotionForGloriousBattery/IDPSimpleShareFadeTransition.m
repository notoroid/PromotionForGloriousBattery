//
//  IDPSimpleShareFadeTransition.m
//  SimpleImageShare
//
//  Created by 能登 要 on 2014/06/26.
//  Copyright (c) 2014年 com.irimasu. All rights reserved.
//

#import "IDPSimpleShareFadeTransition.h"

@implementation IDPSimpleShareFadeTransition

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
