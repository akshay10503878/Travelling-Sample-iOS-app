//
//  ImageCacheManager.m
//  It'sLondon
//
//  Created by akshay bansal on 10/25/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "ImageCacheManager.h"

static ImageCacheManager *sharedInstance;

@interface ImageCacheManager ()

@property (nonatomic, strong) NSCache *imageCache;

@end


@implementation ImageCacheManager

+ (ImageCacheManager*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageCache = [[NSCache alloc] init];
    }
    return self;
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key {
    [self.imageCache setObject:image forKey:key];
}

- (UIImage*)getCachedImageForKey:(NSString*)key {
    return [self.imageCache objectForKey:key];
}
@end
