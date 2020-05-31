//
//  NewsTableViewCell.h
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) News *news;
@property (weak, nonatomic) IBOutlet UILabel *newsDate;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDescription;

@end

NS_ASSUME_NONNULL_END
