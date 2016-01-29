//
//  ViewController.m
//  PromotionForGloriousBattery
//
//  Created by 能登 要 on 2015/12/30.
//  Copyright © 2015年 Irimasu Densan Planning. All rights reserved.
//

#import "ViewController.h"
#import "IDPSimpleShareFadeTransition.h"
#import "EndViewController.h"

@interface ViewController () <UIScrollViewDelegate,UIViewControllerTransitioningDelegate>
{
    __weak IBOutlet UIScrollView *_scrollView;
    IBOutlet UIView *_page1View;
    IBOutlet UIView *_page2View;
    IBOutlet UIView *_page3View;
    IBOutlet UIView *_page4View;
    IBOutlet UIView *_page5View;
    IBOutlet UIView *_page6View;
    __weak IBOutlet NSLayoutConstraint *_imageLeadingConstraint;
    __weak IBOutlet UIImageView *_backgroundView;
    
    __weak IBOutlet UIImageView *_content1View;
    __weak IBOutlet UIImageView *_content2View;
    __weak IBOutlet UIImageView *_content3View;
    
    __weak IBOutlet NSLayoutConstraint *_deviceHorizontalConstraint;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _page1View.frame = (CGRect){CGPointZero,_page1View.frame.size};
    [_scrollView addSubview:_page1View];
    
    _page2View.frame = (CGRect){CGPointMake(CGRectGetMaxX(_page1View.frame),0),_page1View.frame.size};
    [_scrollView addSubview:_page2View];
    
    _page3View.frame = (CGRect){CGPointMake(CGRectGetMaxX(_page2View.frame),0),_page3View.frame.size};
    [_scrollView addSubview:_page3View];

    _page4View.frame = (CGRect){CGPointMake(CGRectGetMaxX(_page3View.frame),0),_page4View.frame.size};
    [_scrollView addSubview:_page4View];
    
    _page5View.frame = (CGRect){CGPointMake(CGRectGetMaxX(_page4View.frame),0),_page5View.frame.size};
    [_scrollView addSubview:_page5View];
    
    _page6View.frame = (CGRect){CGPointMake(CGRectGetMaxX(_page5View.frame),0),_page6View.frame.size};
    [_scrollView addSubview:_page6View];
    
    
    
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_page1View.frame) * 6.0,CGRectGetHeight(_page1View.frame));
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollView.contentOffset.x=%@",@(scrollView.contentOffset.x));
    CGFloat delta = _backgroundView.image.size.width - CGRectGetWidth(self.view.frame);
    CGFloat ratio = _scrollView.contentOffset.x / (_scrollView.contentSize.width - CGRectGetWidth(_page1View.frame));
    
    [self.view setNeedsUpdateConstraints];
    _imageLeadingConstraint.constant = - (delta * MIN(1.0,ratio));
    
    if( (scrollView.contentOffset.x / CGRectGetWidth(self.view.frame)) > 2.0 ){
        
        _deviceHorizontalConstraint.constant = -(scrollView.contentOffset.x - (CGRectGetWidth(self.view.frame) * 2.0));
        
    }
    
    [self.view layoutIfNeeded];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollView.contentOffset.x=%@",@(scrollView.contentOffset.x));
    
    switch ( (NSInteger)(scrollView.contentOffset.x / CGRectGetWidth(self.view.frame)) ) {
        case 0:
        {
            [UIView animateWithDuration:0.5 animations:^{
                _content1View.alpha = 1.0;
                _content2View.alpha = 0.0;
                _content3View.alpha = 0.0;
            } completion:^(BOOL finished) {
               
            }];
        }
            break;
        case 1:
        {
            [UIView animateWithDuration:0.5 animations:^{
                _content1View.alpha = 0.0;
                _content2View.alpha = 1.0;
                _content3View.alpha = 0.0;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case 2:
        {
            [UIView animateWithDuration:0.5 animations:^{
                _content1View.alpha = 0.0;
                _content2View.alpha = 0.0;
                _content3View.alpha = 1.0;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        default:
            break;
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [segue.destinationViewController isKindOfClass:[EndViewController class]] ){
        [segue.destinationViewController setTransitioningDelegate:self];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
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
