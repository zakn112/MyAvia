//
//  CoreDataHelper.h
//  MyAvia
//
//  Created by Андрей Закусов on 28.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataManager.h"
#import "BDFavouriteAirport+CoreDataClass.h"
#import "Airport.h"


NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject
+ (instancetype)sharedInstance;
- (NSArray *)favorites;
- (void)addToFavorite:(Airport *)airport;
- (void)removeFromFavorite:(Airport *)airport;
@end

NS_ASSUME_NONNULL_END
