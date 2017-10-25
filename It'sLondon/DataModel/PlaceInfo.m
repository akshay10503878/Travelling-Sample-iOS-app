//
//  PageInfo.m
//  Sumona
//
//  Created by akshay bansal on 8/6/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "PlaceInfo.h"

@interface PlaceInfo()



@end

@implementation PlaceInfo


-(id)initWithPlace:(NSString *)place imageName:(NSString *)imagename address:(NSString *)address info:(NSString*)info coordinates:(CLLocationCoordinate2D)coordinate{
    
    self = [super init];
    if (self) {
        self.place=place;
        self.imagename=imagename;
        self.address=address;
        self.info=info;
        self.coordinate=coordinate;
    }
    return self;
    

}
@end
