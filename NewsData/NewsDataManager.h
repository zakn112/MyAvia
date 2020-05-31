//
//  NewsDataManager.h
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

#define kNewsDataManagerLoadDataDidComplete @"NewsDataManagerLoadDataDidComplete"

@interface NewsDataManager : NSObject
+ (instancetype)sharedInstance;
- (void)loadData;

@property (nonatomic, strong, readonly) NSArray *news;

@end

NS_ASSUME_NONNULL_END
