//
//  AirportTableViewCell.h
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
@class AirportsViewController;

NS_ASSUME_NONNULL_BEGIN

@interface AirportTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UISwitch *rightSwitch;
@property (nonatomic, strong) Airport *airport;

@property (nonatomic, strong) AirportsViewController *delegate;

@end

NS_ASSUME_NONNULL_END
