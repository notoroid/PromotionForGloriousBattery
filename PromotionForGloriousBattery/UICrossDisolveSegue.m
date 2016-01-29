//
//  UICrossDisolveSegue.m
//  PromotionForGloriousBattery
//
//  Created by 能登 要 on 2015/12/31.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import "UICrossDisolveSegue.h"

@implementation UICrossDisolveSegue

- (void) perform {
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;

    
    
    [UIView transitionWithView:sourceViewController.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [sourceViewController.view addSubview:destinationViewController.view];
                    }
                    completion:^(BOOL finished){
                        [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
                    }];
}

@end
