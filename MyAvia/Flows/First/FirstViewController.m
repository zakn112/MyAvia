//
//  FirstViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 17.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//
#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AirportsViewController.h"
#import "CitiesViewController.h"
#import "MainTabBarController.h"
#import "CoreDataHelper.h"


@interface FirstViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation FirstViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *favouriteAirports = [[CoreDataHelper sharedInstance] favorites];
    
    _airportsArray = [[NSMutableArray alloc] init];
    
    for (BDFavouriteAirport *favouriteAirport in favouriteAirports) {
        [_airportsArray addObject: [NSString stringWithFormat: @"%@", favouriteAirport.name]];
    }
    
    [self addButtonNextController];
    //[self addButtonAirports];
    [self addButtonTickets];
    //[self addButtonCities];
    [self addLable];
    [self addButtonNews];
    [self addButtonPhoto];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadAirportsList];
}

- (void) addButtonNextController{
    CGRect frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Следующей контроллер" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(nextControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) addButtonAirports{
    CGRect frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Аэропорты" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(airportsButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) addButtonTickets{
    CGRect frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Поиск билетов" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(ticketsButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) addButtonCities{
    CGRect frame = CGRectMake(20, 200, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Города" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(citiesButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)nextControllerButtonDidTap:(UIButton *)sender{
    SecondViewController *controller = [SecondViewController new];
    [self.navigationController pushViewController: controller animated:YES];
}

- (void)airportsButtonDidTap:(UIButton *)sender{
    AirportsViewController *controller = [AirportsViewController new];
    controller.firstViewController = self;
    [self.navigationController pushViewController: controller animated:YES];
}

- (void)ticketsButtonDidTap:(UIButton *)sender{
    MainTabBarController *controller = [[MainTabBarController alloc] initWithFirstController:self];
    controller.firstViewController = self;
    [self.navigationController pushViewController: controller animated:YES];
}

- (void)citiesButtonDidTap:(UIButton *)sender{
    CitiesViewController *controller = [CitiesViewController new];
    [self.navigationController pushViewController: controller animated:YES];
}

- (void) addLable{
    CGRect frame = CGRectMake(20, 250, self.view.bounds.size.width - 40, 20);
    _label = [[UILabel alloc] initWithFrame: frame];
    _label.font = [UIFont systemFontOfSize:12.0 weight:UIFontWeightBold];
    _label.textColor = [UIColor darkGrayColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Список выбранных аэропортов";
    [self.view addSubview: _label];
}

- (void) addButtonNews{
    CGRect frame = CGRectMake(20, 300, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Новости" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(newsButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)newsButtonDidTap:(UIButton *)sender{
    UINavigationController *controller = [[UIStoryboard storyboardWithName:@"NewsStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"NewsNavigation"];
    [UIApplication sharedApplication].keyWindow.rootViewController = controller;
    
}

- (void) addButtonPhoto{
    CGRect frame = CGRectMake(20, 350, self.view.bounds.size.width - 40, 30);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Фотографии" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = frame;
    [button addTarget:self action:@selector(photoButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)photoButtonDidTap:(UIButton *)sender{
    UINavigationController *controller = [[UIStoryboard storyboardWithName:@"PhotoStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"PhotoCollection"];
    [UIApplication sharedApplication].keyWindow.rootViewController = controller;
    
}


- (void) addAirportInList: (Airport *)airport{
    [_airportsArray addObject:[NSString stringWithFormat: @"%@", airport.name]];
    [self loadAirportsList];
    
    [[CoreDataHelper sharedInstance] addToFavorite: airport];
}

- (void) removeAirportInList: (Airport *)airport{
    [_airportsArray removeObject:[NSString stringWithFormat: @"%@", airport.name]];
    [self loadAirportsList];
    [[CoreDataHelper sharedInstance] removeFromFavorite: airport];
}

- (void) loadAirportsList{
    _label.text = @"";
    for (NSString *airport in _airportsArray) {
        if( [_label.text isEqualToString:@""] ){
            _label.text = airport;
        }
        else{
            _label.text = [NSString stringWithFormat: @"%@, %@", _label.text, airport];
        }
    }
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
