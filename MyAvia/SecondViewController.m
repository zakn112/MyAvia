//
//  SecondViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 17.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addImage];
    [self addLable];
    [self addSegmentedControl];
}

- (void) addImage{
    CGRect frame = CGRectMake(20, 100, self.view.bounds.size.width - 40, 200);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: frame];
    imageView.image = [UIImage imageNamed:@"airplane1"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView];
}

- (void) addLable{
    CGRect frame = CGRectMake(20, 320, self.view.bounds.size.width - 40, 20);
    UILabel *label = [[UILabel alloc] initWithFrame: frame];
    label.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"МС 21-300";
    [self.view addSubview: label];
}

- (void) addSegmentedControl{
    CGRect frame = CGRectMake(20, 360, self.view.bounds.size.width - 40, 20);
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Нравится", @"Не нравится"]];
    segmentedControl.frame = frame;
    segmentedControl.selectedSegmentTintColor = [UIColor blueColor];
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil];
    
    [segmentedControl setTitleTextAttributes:attributes forState: UIControlStateNormal];
    
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedControl];

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
