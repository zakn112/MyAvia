//
//  FirstViewController.h
//  MyAvia
//
//  Created by Андрей Закусов on 17.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController

- (void) addAirportInList: (Airport *)airport;

- (void) removeAirportInList: (Airport *)airport;

@end

NS_ASSUME_NONNULL_END
