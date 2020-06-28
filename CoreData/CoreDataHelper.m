//
//  CoreDataHelper.m
//  MyAvia
//
//  Created by Андрей Закусов on 28.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "CoreDataHelper.h"


@interface CoreDataHelper ()
@property (nonatomic, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
//@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@end


@implementation CoreDataHelper

+ (instancetype)sharedInstance
{
    static CoreDataHelper *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CoreDataHelper alloc] init];
        [instance setup];
    });
    return instance;
}

- (void)setup {
    if (_persistentContainer == nil){
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"myAvia"];
        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * storeDescription, NSError * error) {
            if(error != nil){
                NSLog(@"Ошибка %@, %@", error, error.userInfo);
                abort();
            }
            
            self.managedObjectContext = self.persistentContainer.viewContext;
        }];
    }
}


- (void)save {
    NSError *error;
    [_managedObjectContext save: &error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
}


- (void)addToFavorite:(Airport *)airport {
    BDFavouriteAirport *favorite = [self favoriteFromAirport:airport];
    if (favorite == nil) {
        BDFavouriteAirport *favorite = [NSEntityDescription insertNewObjectForEntityForName:@"FavouriteAirports" inManagedObjectContext:_managedObjectContext];
        favorite.name = airport.name;
        favorite.created = [NSDate date];
        [self save];
    }
}

- (void)removeFromFavorite:(Airport *)airport {
    BDFavouriteAirport *favorite = [self favoriteFromAirport:airport];
    if (favorite) {
        [_managedObjectContext deleteObject:favorite];
        [self save];
    }
}

- (NSArray *)favorites {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavouriteAirports"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"created" ascending:NO]];
    return [_managedObjectContext executeFetchRequest:request error:nil];
}

- (BDFavouriteAirport *)favoriteFromAirport:(Airport *)airport {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"FavouriteAirports"];
    request.predicate = [NSPredicate predicateWithFormat:@"name == %@ ", airport.name];
    return [[_managedObjectContext executeFetchRequest:request error:nil] firstObject];
}


@end
