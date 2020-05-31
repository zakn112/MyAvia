//
//  NewsDataManager.m
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "NewsDataManager.h"


@implementation NewsDataManager

+ (instancetype)sharedInstance
{
    static NewsDataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NewsDataManager alloc] init];
    });
    return instance;
}

- (void)loadData
{
    NSString *dataUrl = @"https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=de311c7cdb744ded88f6b7b9ad65445e";
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    // 2
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *newsJsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *results = [NSMutableArray new];
        
        NSDictionary *articles = [newsJsonArray valueForKey:@"articles"];
        
        for (NSDictionary *jsonObject in articles) {
            
            News *news = [[News alloc] initWithDictionary: jsonObject];
            [results addObject: news];
            
        }
        
        self->_news = results;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kNewsDataManagerLoadDataDidComplete object:nil];
        });
    }];
    
    [downloadTask resume];
}



@end
