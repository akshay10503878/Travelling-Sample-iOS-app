//
//  MapViewController.h
//  It'sLondon
//
//  Created by akshay bansal on 10/24/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@end
