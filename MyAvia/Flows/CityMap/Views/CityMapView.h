//
//  CityMapView.h
//  MyAvia
//
//  Created by Андрей Закусов on 09.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityMapView : UIView <MKMapViewDelegate>

@property (nonatomic, strong) City *currentCity;
@property (nonatomic, strong) MKMapView *mapView;

- (instancetype)initWithFrame:(CGRect)frame withCity: (City *)city;

@end

NS_ASSUME_NONNULL_END
