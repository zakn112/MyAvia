//
//  CityMapViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 09.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "CityMapViewController.h"
#import "CityMapView.h"

@interface CityMapViewController ()

@end

@implementation CityMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    CityMapView *cityMapView = [[CityMapView alloc] initWithFrame:frame  withCity: self.currentCity];
    
    [self.view addSubview:cityMapView];
    
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
