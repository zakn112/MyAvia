//
//  CitiesViewController.h
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CitiesViewController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *citiesArray;
@property BOOL isSearch;

- (void)update;
@end

NS_ASSUME_NONNULL_END
