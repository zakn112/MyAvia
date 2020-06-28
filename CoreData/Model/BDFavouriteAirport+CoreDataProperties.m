//
//  BDFavouriteAirport+CoreDataProperties.m
//  MyAvia
//
//  Created by Андрей Закусов on 28.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//
//

#import "BDFavouriteAirport+CoreDataProperties.h"

@implementation BDFavouriteAirport (CoreDataProperties)

+ (NSFetchRequest<BDFavouriteAirport *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FavouriteAirports"];
}

@dynamic name;
@dynamic created;

@end
