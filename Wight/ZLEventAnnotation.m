//
//  ZLEventAnnotation.m
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLEventAnnotation.h"

@implementation ZLEventAnnotation

@synthesize coordinate;

-(id)initWithLocation:(CLLocationCoordinate2D)coord {
    
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    
    return self;
}

@end
