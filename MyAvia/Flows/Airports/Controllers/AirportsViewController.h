//
//  AirportsViewController.h
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "AirportTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirportsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonnull) UITableView *tableView;

@property (nonatomic, strong) FirstViewController *firstViewController;

-(void) airortSwithChangedON: (BOOL) on inCell: (AirportTableViewCell *) airportTableViewCell;

@end

NS_ASSUME_NONNULL_END
