//
//  MainTabBarController.h
//  MyAvia
//
//  Created by Андрей Закусов on 19.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainTabBarController : UITabBarController
@property (nonatomic, strong) FirstViewController *firstViewController;

- (instancetype)initWithFirstController:(FirstViewController *)firstViewController;

@end

NS_ASSUME_NONNULL_END
