//
//  NotificationsViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 04.07.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "NotificationsViewController.h"
#import "FirstViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePiker;
@property (weak, nonatomic) IBOutlet UITextField *bodyTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation NotificationsViewController

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
- (IBAction)addNotificationButtonPress:(id)sender {
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = self.titleTextField.text;
    content.body = self.bodyTextField.text;
    content.sound = [UNNotificationSound defaultSound];

    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar componentsInTimeZone:[NSTimeZone systemTimeZone] fromDate:self.datePiker.date];
    NSDateComponents *newComponents = [[NSDateComponents alloc] init];
    newComponents.calendar = calendar;
    newComponents.timeZone = [NSTimeZone defaultTimeZone];
    newComponents.month = components.month;
    newComponents.day = components.day;
    newComponents.hour = components.hour;
    newComponents.minute = components.minute;

    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:newComponents repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"Notification"
                                                                          content:content trigger:trigger];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:nil];
    
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = navigationController;
}

@end
