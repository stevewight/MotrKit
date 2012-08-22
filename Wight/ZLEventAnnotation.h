//
//  ZLEventAnnotation.h
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ZLEventAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate; 

-(id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
