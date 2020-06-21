//
//  MainTabBarController.m
//  MyAvia
//
//  Created by Андрей Закусов on 19.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "MainTabBarController.h"
#import "AirportsViewController.h"
#import "CitiesViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (instancetype)initWithFirstController:(FirstViewController *)firstViewController
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        AirportsViewController *airportsController = [[AirportsViewController alloc] init];
        _firstViewController = firstViewController;
        airportsController.firstViewController = firstViewController;
        airportsController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Аэропорты" image:nil tag:0];
        CitiesViewController *citiesController = [[CitiesViewController alloc] init];
        citiesController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Города" image:nil tag:1];
        self.viewControllers = @[airportsController, citiesController];
        self.tabBar.tintColor = [UIColor blackColor];
        self.selectedIndex = 0;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
