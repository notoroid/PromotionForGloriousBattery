//
//  StartViewController.m
//  PromotionForGloriousBattery
//
//  Created by 能登 要 on 2015/12/31.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import "StartViewController.h"
#import "IDPSimpleShareFadeTransition.h"

@interface StartViewController () <UIViewControllerTransitioningDelegate>
{
    
    __weak IBOutlet UIImageView *_imageView;
}
@end

@implementation StartViewController 

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    _imageView.alpha = 0.0;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:1.0 delay:3.0 options:0 animations:^{
        _imageView.alpha = 1.0;
    } completion:^(BOOL finished) {
       
    }];
}


- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setTransitioningDelegate:self];
    
}

#pragma mark -
#pragma mark UIViewControllerTransitioningDelegate
/*
 アニメーションコントローラを返すメソッド（モーダルビュー表示）
 */
- (id <UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[IDPSimpleShareFadeTransition alloc] init];
}


/*
 アニメーションコントローラを返すメソッド（モーダルビュー消去）
 */
- (id <UIViewControllerAnimatedTransitioning>)
animationControllerForDismissedController:(UIViewController *)dismissed
{
    return nil;
}

@end
