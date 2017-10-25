//
//  MapViewController.m
//  It'sLondon
//
//  Created by akshay bansal on 10/24/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "MapViewController.h"
#import "LocationManagerSingleton.h"

@interface MapViewController ()<CLLocationManagerDelegate>
{
    
    LocationManagerSingleton *locationManager;
    double latitude_UserLocation, longitude_UserLocation;
}
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self loadUserLocation];
    
    // Do any additional setup after loading the view.
//    [self.mapView setMapType:MKMapTypeStandard];
//    [self.mapView setZoomEnabled:YES];
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setScrollEnabled:YES];
    [self.mapView setDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadUserLocation
{
    locationManager=[LocationManagerSingleton sharedSingleton];
    locationManager.locationManager.delegate=self;
}




- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0)
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
    [locationManager.locationManager stopUpdatingLocation];
    [self loadMapView];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [locationManager.locationManager stopUpdatingLocation];
}


- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude = latitude_UserLocation, .longitude = longitude_UserLocation};
    
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = 0.1, .longitudeDelta = 0.1};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [self.mapView setRegion:objMapRegion];
}



-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    //[self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
    
}


- (void)zoomToFitMapAnnotations:(MKMapView *)mapView {
    if ([mapView.annotations count] == 0) return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in mapView.annotations) {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    
    // Add a little extra space on the sides
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1;
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1;
    
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
}

- (IBAction)locateMe:(id)sender {
    
   // [self loadUserLocation];
    [self loadMapView];
}

- (IBAction)getDirection:(id)sender {
    
    MKMapItem *item=[[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(28.672,77.419319452384296)] ];
    [self getDirections:item];
    
    
    NSString* url = [NSString stringWithFormat: @"http://maps.apple.com/maps?saddr=%f,%f&daddr=%@",latitude_UserLocation,longitude_UserLocation,@"big%20ben"];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
    
}




- (IBAction)maptypeSegmentControl:(id)sender {
    UISegmentedControl *control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self.mapView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [self.mapView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [self.mapView setMapType:MKMapTypeHybrid];
            break;
            
        default:
            break;
    }
}
- (IBAction)zoomIn:(id)sender {
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = self.mapView.region.span.latitudeDelta/2, .longitudeDelta = self.mapView.region.span.longitudeDelta/2};
    MKCoordinateRegion objMapRegion = {self.mapView.region.center, objCoorSpan};
    [self.mapView setRegion:objMapRegion];

}

- (IBAction)zoomOut:(id)sender {
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = self.mapView.region.span.latitudeDelta*2, .longitudeDelta = self.mapView.region.span.longitudeDelta*2};
    MKCoordinateRegion objMapRegion = {self.mapView.region.center, objCoorSpan};
    [self.mapView setRegion:objMapRegion];
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)getDirections:(MKMapItem*)destination
{
    MKDirectionsRequest *request =
    [[MKDirectionsRequest alloc] init];
    
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    request.destination = destination;
    request.requestsAlternateRoutes = NO;
    MKDirections *directions =
    [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             // Handle error
             NSLog(@"%@",error.localizedDescription);
         } else {
             [self showRoute:response];
         }
     }];
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [self.mapView
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps)
        {
            NSLog(@"%@", step.instructions);
        }
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 3.0;
    return renderer;
}



@end
