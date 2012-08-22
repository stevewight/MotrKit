//
//  ZLEventLocationDataController.m
//  Wight
//
//  Created by Steve Wight on 8/21/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLEventLocationDataController.h"

@implementation ZLEventLocationDataController

@synthesize masterEvenList;

-(id)init {
    
    self.masterEvenList = [[NSMutableArray alloc] init];
    
    return self;
}

-(ZLEventLocation *)getObjectFromMasterListAtIndex:(NSUInteger)index {
    return [self.masterEvenList objectAtIndex:index];
}

-(void)addEventToMasterList:(ZLEventLocation *)event {
    [self.masterEvenList addObject:event];
}

-(NSUInteger)countOfMasterEvenList {
    return [self.masterEvenList count];
}

-(NSDate *)saveSession {
    
    ZLAppDelegate *appDel = (ZLAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDel managedObjectContext];
    
    NSManagedObject *trackingSession = [NSEntityDescription insertNewObjectForEntityForName:@"TrackingSession" inManagedObjectContext:context];
    
    [trackingSession setValue:[NSDate date] forKey:@"date"];
    NSMutableSet *eventSet = [[NSMutableSet alloc] init];
    
    for (ZLEventLocation *event in self.masterEvenList ) {
        NSManagedObject *eventLocationManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"EventLocation" inManagedObjectContext:context];
        
        [eventLocationManagedObject setValue:event.type forKey:@"type"];
        [eventLocationManagedObject setValue:event.desc forKey:@"desc"];
        [eventLocationManagedObject setValue:[NSNumber numberWithDouble:event.loc.coordinate.latitude] forKey:@"lat"];
        [eventLocationManagedObject setValue:[NSNumber numberWithDouble:event.loc.coordinate.longitude] forKey:@"lng"];
        [eventLocationManagedObject setValue:trackingSession forKey:@"trackingSession"];
        [eventSet addObject:eventLocationManagedObject];
    }
    
    [trackingSession setValue:eventSet forKey:@"eventLocations"];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Shit didnt work dude, check it out: %@", [error localizedDescription]);
    } else {
        NSLog(@"Session Saved");
    }
    
    return [trackingSession valueForKey:@"date"];
}

-(void)pullSessions {
    
    NSError *error;
    ZLAppDelegate *appDel = (ZLAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDel managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TrackingSession" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *s in fetchedObjects) {
        NSLog(@"el date: %@",[s valueForKey:@"date"]);
        
        NSSet *trackingSessionEventLocations = [s valueForKey:@"eventLocations"];
        for (NSManagedObject *e in trackingSessionEventLocations) {
            NSLog(@"la type: %@",[e valueForKey:@"type"]);
            NSLog(@"la desc: %@",[e valueForKey:@"desc"]);
            NSLog(@"la lat: %@",[e valueForKey:@"lat"]);
            NSLog(@"la lng: %@",[e valueForKey:@"lng"]);
        }
        
    }

    NSLog(@"sessions have been pulled");
}

@end
