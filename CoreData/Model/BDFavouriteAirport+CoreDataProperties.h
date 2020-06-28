//
//  BDFavouriteAirport+CoreDataProperties.h
//  MyAvia
//
//  Created by Андрей Закусов on 28.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//
//

#import "BDFavouriteAirport+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface BDFavouriteAirport (CoreDataProperties)

+ (NSFetchRequest<BDFavouriteAirport *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *created;

@end

NS_ASSUME_NONNULL_END
