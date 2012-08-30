//
//  ZLSessionViewController.h
//  Wight
//
//  Created by Steve Wight on 8/22/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ZLSession.h"
#import "ZLEventAnnotation.h"
#import "ZLEventLocation.h"

@interface ZLSessionViewController : UITableViewController

@property (nonatomic, retain) ZLSession *trackingSession;
@property (nonatomic, retain) IBOutlet UILabel *sessionDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalEventsLabel;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)doneButtonPressed:(id)sender;
-(void)setSessionLocationsOnMap;

@end
