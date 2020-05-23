//
//  FirstViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 17.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self addButtonNextController];
    [self addButtonAirports];
    [self addButtonCities];
    
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

- (void)nextControllerButtonDidTap:(UIButton *)sender
{
    SecondViewController *controller = [SecondViewController new];
    [self.navigationController pushViewController: controller animated:YES];
}

- (void)airportsButtonDidTap:(UIButton *)sender
{
   
}

- (void)citiesButtonDidTap:(UIButton *)sender
{
    
}

- (void) addTextField{
    CGRect frame = CGRectMake(20, 150, self.view.bounds.size.width - 40, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Введите значение...";
    textField.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightLight];
    [self.view addSubview: textField];
    
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
