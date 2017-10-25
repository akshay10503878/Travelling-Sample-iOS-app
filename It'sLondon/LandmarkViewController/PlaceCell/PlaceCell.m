//
//  PlaceCell.m
//  It'sLondon
//
//  Created by akshay bansal on 10/19/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "PlaceCell.h"

@interface PlaceCell()
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;

@end


@implementation PlaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setPlace:(PlaceInfo *)place
{
    self.image.image=[UIImage imageNamed:place.imagename];
    self.name.text=place.place;
    self.address.text=place.address;
    
    
}

@end
