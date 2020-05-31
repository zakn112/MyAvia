//
//  News.h
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *newsDescription;
@property (nonatomic, strong) NSDate *publishedAt;
@property (nonatomic, strong) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
