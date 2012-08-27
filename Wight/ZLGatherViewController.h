//
//  ZLGatherViewController.h
//  Wight
//
//  Created by Steve Wight on 8/20/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ZLEventLocationDataController.h"
#import "ZLEventLocation.h"
#import "ZLEventAnnotation.h"
#import "ZLSessionViewController.h"
#import "ZLSession.h"

#define METERS_PER_MILE 1609.344

@interface ZLGatherViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) ZLEventLocationDataController *eventDataController;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UITableView *eventTableView;
@property (nonatomic, retain) CLLocationManager *locationManger;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mapTypeSegment;
@property (nonatomic) int zoomLevel;
@property (nonatomic, retain) CLLocation *startLocation;

-(void) setRegionWithZoom:(int)zoomLevel;
-(void) centerMap;
-(void) startUpdatingLocationEvents;
-(IBAction)buttonFire:(id)sender;
-(IBAction)buttonZoomIn:(id)sender;
-(IBAction)buttonZoomOut:(id)sender;
-(IBAction)changeSeg:(id)sender;
-(IBAction)completeSession:(id)sender;
-(IBAction)exitSession:(id)sender;

@end
