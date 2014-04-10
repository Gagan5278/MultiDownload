//
//  ViewController.m
//  MultiDiwnload
//
//  Created by Gagan on 10/04/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize urlMutableArray,downloads;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MemoryWarningReceived) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
 }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark- download Delegate
- (void) didFinishDownload:(NSNumber*)idx {
    //want to load data, Use method "dataAtIndex" & convert data into required format extension like image, files etc
	NSLog(@"%d download: %@", [idx intValue], [downloads dataAsStringAtIndex: [idx intValue]]);
}

- (void) didFinishAllDownload {
	NSLog(@"Finished all download!");
	downloads =nil;
}

-(void)didFailDownloadWithError:(NSError*)error withRequest:(int)index
{
    NSLog(@"error is : %@",error.localizedDescription);
    // Fail url from mutable array at index "index"
    NSLog(@"Failed URL is : %@", [self.urlMutableArray objectAtIndex:index]);
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//Handle Memory Warning issues
-(void)MemoryWarningReceived
{
    [[NSURLCache sharedURLCache]removeAllCachedResponses];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (IBAction)StartButtonPessed:(id)sender {
    //Initialize DownLoadData
    self.urlMutableArray = [NSMutableArray arrayWithObjects:@"https://itunes.apple.com/search?term=jack+johnson",@"https://itunes.apple.com/search?term=jack+johnson&limit=25",@"https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo",@"https://itunes.apple.com/search?term=jim+jones&country=ca",@"https://itunes.apple.com/search?term=yelp&country=us&entity=software",@"https://itunes.apple.com/lookup?amgArtistId=468749,5723",@"https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=song&limit=5&sort=recent", nil];
	self.downloads = [[MultipleDownload alloc] initWithUrls: self.urlMutableArray];
	self.downloads.delegate = self;
}
@end
