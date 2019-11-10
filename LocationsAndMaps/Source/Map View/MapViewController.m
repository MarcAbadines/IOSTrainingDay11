//
//  MapViewController.m
//  LocationsAndMaps
//
//  Created by Zairah Ylagan on 11/10/19.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

// Mark - Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMap];
}

// Mark - Functions
-(void)showTitle:(NSString *) title withMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {}];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)setupMap {
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeHybrid;
    _mapView.delegate = self;
}

// Mark - MapView Delegate

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(aUserLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotations
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = aUserLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}

@end
