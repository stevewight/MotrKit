//
//  ZLGatherViewController.m
//  Wight
//
//  Created by Steve Wight on 8/20/12.
//  Copyright (c) 2012 Ziato Labs. All rights reserved.
//

#import "ZLGatherViewController.h"

@interface ZLGatherViewController ()

@end

@implementation ZLGatherViewController

@synthesize eventDataController;
@synthesize mapView;
@synthesize eventTableView;
@synthesize locationManger;
@synthesize mapTypeSegment;
@synthesize zoomLevel;
@synthesize startLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation {
    
    //set the starting location if self.startLocation is nil
    if (self.startLocation == nil) {
        self.startLocation = newLocation;
    }
    
    NSLog(@"location manager fired");
    [self.mapView setCenterCoordinate:newLocation.coordinate];
    
    ZLEventLocation *event = [[ZLEventLocation alloc] init];
    event.type = @"[LM]";
    event.desc = @"Loc Mng didUpdateLoc";
    event.loc = newLocation;
    
    NSLog(@"event in LM didUpdateLoc %@",event);
    
    [self.eventDataController addEventToMasterList:event];
    [self.eventTableView reloadData];
    
}

#pragma mark - table delegate functions

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"number of rows in section fired, count is: %d", [self.eventDataController countOfMasterEvenList]);
    return [self.eventDataController countOfMasterEvenList];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUInteger eventIndex = [self.eventDataController countOfMasterEvenList] - 1 - indexPath.row;
    ZLEventLocation *event = [self.eventDataController getObjectFromMasterListAtIndex:eventIndex];
    
     NSString *CellIdentifier;
    
    if ([event.type isEqualToString:@"[BF]"]) {
        CellIdentifier = @"ButtonEventCell";
    } else {
        CellIdentifier = @"EventCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell  == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    UILabel *typeLabel = (UILabel *)[cell viewWithTag:100];
    typeLabel.text = event.type;
    UILabel *descLabel = (UILabel *)[cell viewWithTag:101];
    descLabel.text = event.desc;
    
    if ([event.type isEqualToString:@"[LM]"]) {
        UILabel *latLabel = (UILabel *)[cell viewWithTag:102];
        latLabel.text = [NSString stringWithFormat:@"%f", event.loc.coordinate.latitude];
        UILabel *lngLabel = (UILabel *)[cell viewWithTag:103];
        lngLabel.text = [NSString stringWithFormat:@"%f", event.loc.coordinate.longitude];
    } else {
        UILabel *distanceLabel = (UILabel *)[cell viewWithTag:200];
        distanceLabel.text = [NSString stringWithFormat:@"%f", [event.loc distanceFromLocation:self.startLocation]];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"CompleteShowSession"]) {
        ZLSessionViewController *sessionViewController = (ZLSessionViewController*)[[segue destinationViewController] topViewController];
        NSLog(@"segue has fired %@", sessionViewController);
        NSDate *sessionDate = [self.eventDataController saveSession];
        
        ZLSession *theSession = [[ZLSession alloc] init];
        NSLog(@"this is the session %@",theSession);
        theSession.date = sessionDate;
        theSession.dataController = self.eventDataController;
        [sessionViewController setTrackingSession:theSession];
    }
}

-(void) startUpdatingLocationEvents {
    
    if (locationManger == nil) {
        locationManger = [[CLLocationManager alloc] init];
    }
    
    locationManger.delegate = self;
    
    locationManger.desiredAccuracy = kCLLocationAccuracyBest;
    locationManger.distanceFilter = 31;
    
    [locationManger startUpdatingLocation];
}

-(void) buttonFire:(id)sender {
    
    NSLog(@"bang bang has fired");
    
    ZLEventLocation *event = [[ZLEventLocation alloc] init];
    event.type = @"[BF]";
    event.desc = @"button fired loc event";
    event.loc = self.locationManger.location;
    
    NSLog(@"event in buttonFire %@",event);
    
    [self.eventDataController addEventToMasterList:event];
    [self.eventTableView reloadData];
    
    ZLEventAnnotation *annotation = [[ZLEventAnnotation alloc] initWithLocation:event.loc.coordinate];
    [self.mapView addAnnotation:annotation];
//    CLLocationDistance distance = 5.0;
//    MKCircle *circle = [MKCircle circleWithCenterCoordinate:event.loc.coordinate radius:distance];
//    [self.mapView addOverlay:circle];
}

-(IBAction)buttonZoomIn:(id)sender {
    if (self.zoomLevel > 1) {
        self.zoomLevel = self.zoomLevel - 1;
        [self setRegionWithZoom:self.zoomLevel];
    }
}

-(IBAction)buttonZoomOut:(id)sender {
    if (self.zoomLevel < 5) {
        self.zoomLevel = self.zoomLevel + 1;
        [self setRegionWithZoom:self.zoomLevel];
    }
}

-(IBAction)completeSession:(id)sender {
    
    [self.eventDataController saveSession];
    
}

-(IBAction)changeSeg:(id)sender {
    NSLog(@"segment has changed");
    
    NSLog(@"this is the seg index %d", self.mapTypeSegment.selectedSegmentIndex);
    
    [self.mapView setMapType:MKMapTypeHybrid];
    
    if (self.mapTypeSegment.selectedSegmentIndex == 0) {
        mapView.mapType = MKMapTypeStandard;
    } else if (self.mapTypeSegment.selectedSegmentIndex = 1) {
        self.mapView.mapType = MKMapTypeSatellite;
    } else {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    
}


-(void) centerMap {
    NSLog(@"centerMap fires");
    [self.mapView setCenterCoordinate:self.locationManger.location.coordinate animated:YES];
}

- (void) setRegionWithZoom:(int)theZoomLevel {
    
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    
    if (theZoomLevel == 1) {
        span.latitudeDelta = 0.0005;
        span.longitudeDelta = 0.00014;
    } else if (theZoomLevel == 2) {
        span.latitudeDelta = 0.005;
        span.longitudeDelta = 0.0014;
    } else if (theZoomLevel == 3) {
        span.latitudeDelta = 0.03;
        span.longitudeDelta = 0.012;
    } else if (theZoomLevel == 4) {
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.08;
    } else {
        span.latitudeDelta = 8;
        span.longitudeDelta = 6;
    }
    
    region.center = locationManger.location.coordinate;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow];
    [self startUpdatingLocationEvents];
    self.zoomLevel = 3;
    [self setRegionWithZoom:self.zoomLevel];
    self.eventDataController = [[ZLEventLocationDataController alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
