//
//  ViewController.m
//  toasty
//
//  Created by Daniel on 11/18/14.
//  Copyright (c) 2014 Househappy. All rights reserved.
//

#import "ViewController.h"
#import <CRToast/CRToast.h>

@interface ViewController ()

@end

CRToastInteractionResponder * DMSwipeResponder() {
    return [CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeSwipe automaticallyDismiss:YES block:^(CRToastInteractionType interactionType) {
        NSLog(@"Notifcation Interacted with: %@", NSStringFromCRToastInteractionType(interactionType));
    }];
}
CRToastInteractionResponder * DMTapResponder() {
    return [CRToastInteractionResponder interactionResponderWithInteractionType:CRToastInteractionTypeTap automaticallyDismiss:YES block:^(CRToastInteractionType interactionType) {
        NSLog(@"Notifcation Interacted with: %@", NSStringFromCRToastInteractionType(interactionType));
    }];
}

NSDictionary * DMToastDefaultDictionary() {
    return @{kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),
             kCRToastBackgroundColorKey: [UIColor colorWithRed:1 green:0.37 blue:0.0 alpha:1.0],
             kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
             kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeGravity),
             kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
             kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop),
             kCRToastNotificationPresentationTypeKey : @(CRToastPresentationTypePush),
             kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
             kCRToastTimeIntervalKey : @(7)
             };
}

@implementation ViewController

- (IBAction)withTapPressed:(UIButton *)sender {
    NSMutableDictionary *options = [DMToastDefaultDictionary() mutableCopy];
    
    options[kCRToastInteractionRespondersKey] = @[DMTapResponder()];
    options[kCRToastTextKey] = @"Only Tap";
    
    [CRToastManager showNotificationWithOptions:options completionBlock:nil];
}
- (IBAction)withSwipePressed:(UIButton *)sender {
    NSMutableDictionary *options = [DMToastDefaultDictionary() mutableCopy];
    
    options[kCRToastInteractionRespondersKey] = @[DMSwipeResponder()];
    options[kCRToastTextKey] = @"Only Swipe";
    
    [CRToastManager showNotificationWithOptions:options completionBlock:nil];
}
- (IBAction)withTapAndSwipePressed:(UIButton *)sender {
    NSMutableDictionary *options = [DMToastDefaultDictionary() mutableCopy];
    
    options[kCRToastInteractionRespondersKey] = @[DMTapResponder(), DMSwipeResponder()];
    options[kCRToastTextKey] = @"Why not both?";
    
    [CRToastManager showNotificationWithOptions:options completionBlock:nil];
}
- (IBAction)withTapAndSwipeDifferentPressed:(UIButton *)sender {
    NSMutableDictionary *options = [DMToastDefaultDictionary() mutableCopy];
    
    options[kCRToastInteractionRespondersKey] = @[DMSwipeResponder(), DMTapResponder()];
    options[kCRToastTextKey] = @"Why not both?\nBut with a new order";
    
    [CRToastManager showNotificationWithOptions:options completionBlock:nil];
}

@end
