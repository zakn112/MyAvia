//
//  CityMapView.m
//  MyAvia
//
//  Created by Андрей Закусов on 09.06.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "CityMapView.h"

@interface CityMapView()

@property (nonatomic, strong) NSString *cityAdress;

@end

@implementation CityMapView

- (instancetype)initWithFrame:(CGRect)frame withCity: (City *)city
{
    self = [super initWithFrame:frame];
    if (self) {
        self.currentCity = city;
        self.mapView = [[MKMapView alloc] initWithFrame: frame];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(city.coordinate, 1000000, 1000000);
        [self.mapView setRegion: region animated: YES];
        
        self.mapView.delegate = self;
        
        NSString *coordinateString = [NSString stringWithFormat: @"%f,%f", city.coordinate.latitude, city.coordinate.longitude];
        
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        
        [geocoder geocodeAddressString:coordinateString completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            if ([placemarks count] > 0) {
                for (MKPlacemark *placemark in placemarks) {
                    self.cityAdress = [NSString stringWithFormat: @"%@,%@", [placemark.addressDictionary valueForKey:@"Country"], [placemark.addressDictionary valueForKey:@"Name"]];
                }
            }
            [self addCityAnnotation];
            [self addSubview:self.mapView];
        }];
        
       
    }
    return self;
}

-(void) addCityAnnotation{
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = self.currentCity.name;
    annotation.subtitle = self.cityAdress;
    annotation.coordinate =self.currentCity.coordinate;
    [self.mapView addAnnotation:annotation];
    
}

#pragma mark - Map view delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
   
    static NSString *identifier = @"currentCity";
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;

}

@end
