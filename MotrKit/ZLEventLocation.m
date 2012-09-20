//
//  ZLEventLocation.m
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLEventLocation.h"

@implementation ZLEventLocation

@synthesize type;
@synthesize desc;
@synthesize loc;

-(void)setLocLat:(NSNumber*)lat Lng:(NSNumber*)lng {
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:[lat doubleValue] longitude:[lng doubleValue]];
    self.loc = location;
}

@end
