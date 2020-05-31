//
//  News.m
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"title"];
        _newsDescription = [dictionary valueForKey:@"description"];
        
        NSString *dateString =  [dictionary valueForKey:@"publishedAt"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
         NSDate *date = [dateFormatter dateFromString:dateString];
        
        _publishedAt = date;
        _content = [dictionary valueForKey:@"content"];
       
    }
    return self;
}

@end
