//
//  ZLSessionDataController.m
//  Wight
//
//  Created by Steve Wight on 8/27/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLSessionDataController.h"

@implementation ZLSessionDataController

@synthesize sessionsMasterList;

-(void)pullSessions {
    
    self.sessionsMasterList = [[NSMutableArray alloc] init];
    
    NSError *error;
    ZLAppDelegate *appDel = (ZLAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDel managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TrackingSession" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *s in fetchedObjects) {
        NSLog(@"el date: %@",[s valueForKey:@"date"]);
        
        ZLSession *newSession = [[ZLSession alloc] init];
        newSession.date = [s valueForKey:@"date"];
        
        NSSet *trackingSessionEventLocations = [s valueForKey:@"eventLocations"];
        [newSession createEventLocationsFromSet:trackingSessionEventLocations];
        [self.sessionsMasterList addObject:newSession];
        NSLog(@"count of sessionsMasterList: %d", [self.sessionsMasterList count]);
        
    }
    
    NSLog(@"sessions have been pulled");
}


-(ZLSession *)sessionInMasterListAtIndex:(NSUInteger)theIndex {
    return [self.sessionsMasterList objectAtIndex:theIndex];
}

-(NSUInteger)countOfSessionsMasterList {
    return [self.sessionsMasterList count];
}

@end
