//
//  ZLSession.m
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLSession.h"

@implementation ZLSession

@synthesize date;
@synthesize dataController;

-(id)init {

    self.dataController = [[ZLEventLocationDataController alloc] init];
    
    return self;
}

-(void)createEventLocationsFromSet:(NSSet *)eventLocations {
    
    for (NSManagedObject *e in eventLocations) {
        
        ZLEventLocation *eventLocation = [[ZLEventLocation alloc] init];
        eventLocation.type = [e valueForKey:@"type"];
        eventLocation.desc = [e valueForKey:@"desc"];
        [eventLocation setLocLat:[e valueForKey:@"lat"] Lng:[e valueForKey:@"lng"]];
        [self.dataController addEventToMasterList:eventLocation];
        NSLog(@"count of session eventLocation data controller: %d",[self.dataController countOfMasterEvenList]);
        NSLog(@"! type: %@",[e valueForKey:@"type"]);
        NSLog(@"!! desc: %@",[e valueForKey:@"desc"]);
        NSLog(@"!!! lat: %@",[e valueForKey:@"lat"]);
        NSLog(@"!!!! lng: %@",[e valueForKey:@"lng"]);
        NSLog(@"+ type: %@",eventLocation.type);
        NSLog(@"++ desc: %@",eventLocation.desc);
        NSLog(@"+++ lat: %f",eventLocation.loc.coordinate.latitude);
        NSLog(@"++++ lng: %f",eventLocation.loc.coordinate.longitude);
    }

}

@end
