//
//  LandMarkDetalVC.m
//  It'sLondon
//
//  Created by akshay bansal on 10/24/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "LandMarkDetalVC.h"
#import "MapViewController.h"
#import "LocationManagerSingleton.h"
#import "ImageCacheManager.h"

@interface LandMarkDetalVC ()
{
    LocationManagerSingleton *locationManagerSingleton;
    ImageCacheManager *imageCacheManager;
}
@property (strong, nonatomic) IBOutlet UIImageView *placeImage;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *info;

@property (strong, nonatomic) IBOutlet UIImageView *locationPic;


@end

@implementation LandMarkDetalVC

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    self.navigationItem.title = self.pInfo.place;
    // Do any additional setup after loading the view.
    self.placeImage.image=[UIImage imageNamed:self.pInfo.imagename];
    self.name.text=self.pInfo.place;
    self.address.text=self.pInfo.address;
    self.info.text=self.pInfo.info;
    self.locationPic.image=[UIImage imageNamed:@"loding"];
    
    [self loadmapImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
   
    
}

-(void)loadmapImage{
    
    NSString *staticMapUrl = [NSString stringWithFormat:@"http://maps.google.com/maps/api/staticmap?markers=color:red|%f,%f&zoom=15&size=%.0fx130&sensor=true",self.pInfo.coordinate.latitude, self.pInfo.coordinate.longitude,self.view.frame.size.width-20];
    
    imageCacheManager = [ImageCacheManager sharedInstance];
    
    if ([imageCacheManager getCachedImageForKey:staticMapUrl]) {
        self.locationPic.image=[imageCacheManager getCachedImageForKey:staticMapUrl];
    }
    else
    {
        NSURL *mapUrl = [NSURL URLWithString:[staticMapUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:mapUrl
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    if (error) {
                        return ;
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:mapUrl]];
                        [imageCacheManager cacheImage:image forKey:staticMapUrl];
                        self.locationPic.image=image;
                    });
                    
                }
          ] resume];
        
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)getDirections:(id)sender {
    locationManagerSingleton=[LocationManagerSingleton sharedSingleton];
    
    NSString* url = [NSString stringWithFormat: @"http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f",locationManagerSingleton.locationManager.location.coordinate.latitude,locationManagerSingleton.locationManager.location.coordinate.longitude,self.pInfo.coordinate.latitude,self.pInfo.coordinate.longitude];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];

    
}

-(void)doneButtonTapped:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
