//
//  ZLAppDelegate.h
//  Wight
//
//  Created by Steve Wight on 8/20/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
