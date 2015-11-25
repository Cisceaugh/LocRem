//
//  LocationController.m
//  LocRem
//
//  Created by Francisco Ragland Jr on 11/24/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "LocationController.h"

@interface LocationController () <CLLocationManagerDelegate>

@end

@implementation LocationController

+ (LocationController *)sharedController {
    static LocationController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[self alloc]init];
    });
    
    return sharedController;
}

-(id)init {
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 50;
        
        [_locationManager requestWhenInUseAuthorization];
    }
    return self;
}

#pragma mark - Location Manager 

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self.delegate locationControllerDidUpdateLocation:locations.lastObject];
    [self setLocation:locations.lastObject];
}

@end