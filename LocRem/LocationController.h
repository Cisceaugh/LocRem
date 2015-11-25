//
//  LocationController.h
//  LocRem
//
//  Created by Francisco Ragland Jr on 11/24/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

@import UIKit;
@import CoreLocation;

@protocol LocationControllerDelegate <NSObject>

- (void)locationControllerDidUpdateLocation:(CLLocation *)location;

@end

@interface LocationController : NSObject

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (weak, nonatomic) id delegate;

//singleton
+ (LocationController *)sharedController;

@end