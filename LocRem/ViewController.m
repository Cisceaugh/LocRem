//
//  ViewController.m
//  LocRem
//
//  Created by Francisco Ragland Jr on 11/23/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locationButtonSelected:(UIButton*)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestPermissions];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//functions

- (void)requestPermissions {

    [self setLocationManager:[[CLLocationManager alloc]init]];
    [self.locationManager requestWhenInUseAuthorization];
    
}

- (void)setRegionForCoordinate:(MKCoordinateRegion)region {
    [self.mapView setRegion:region animated:YES];
}

- (IBAction)locationButtonSelected:(UIButton *) sender {
    
    NSString *buttonTitle = sender.titleLabel.text;
    
    if ([buttonTitle isEqualToString:@"Loc 1"]) {
        NSLog(@"Loc 1");
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.212609, -122.468036);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
        
        [self setRegionForCoordinate:region];
    }
    
    if ([buttonTitle isEqualToString:@"Loc 2"]) {
        NSLog(@"Loc 2");
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(37.331820, -122.031180);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
        
        [self setRegionForCoordinate:region];
    }
    
    if ([buttonTitle isEqualToString:@"Loc 3"]) {
        NSLog(@"Loc 3");
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.663136, -122.318339);
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
        
        [self setRegionForCoordinate:region];
    }
}

@end
