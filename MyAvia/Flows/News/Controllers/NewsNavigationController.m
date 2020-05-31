//
//  NewsNavigationController.m
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "NewsNavigationController.h"
#import "FirstViewController.h"

@interface NewsNavigationController ()

@end

@implementation NewsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   // Do any additional setup after loading the view.
}

-(void) backButtonPress{
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = navigationController;
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
