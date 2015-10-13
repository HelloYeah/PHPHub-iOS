//
//  JumpToOtherVCHandler.m
//  PHPHub
//
//  Created by Aufree on 10/8/15.
//  Copyright © 2015 ESTGroup. All rights reserved.
//

#import "JumpToOtherVCHandler.h"

#import "BaseTabBarViewController.h"
#import "TopicDetailViewController.h"
#import "LoginViewController.h"

#import "AppDelegate.h"

@implementation JumpToOtherVCHandler
+ (void)pushToOtherView:(UIViewController *)vc animated:(BOOL)animated {
    BaseTabBarViewController *tabbar = [(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarViewController];
    [tabbar pushToViewController:vc animated:YES];
}

+ (void)presentToOtherView:(UIViewController *)vc animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    BaseTabBarViewController *tabbar = [(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    [tabbar presentViewController:navigationController animated:animated completion:completion];
}

+ (void)jumpToTopicDetailWithTopic:(TopicEntity *)topic {
    TopicDetailViewController *topicDetailVC = [[UIStoryboard storyboardWithName:@"Topic" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"topic"];
    topicDetailVC.topic = topic;
    [self pushToOtherView:topicDetailVC animated:YES];
}

+ (void)jumpToLoginVC {
    LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Passport"
                                                              bundle:[NSBundle mainBundle]]
                                    instantiateViewControllerWithIdentifier:@"login"];
    [self presentToOtherView:loginVC animated:YES completion:nil];
}
@end
