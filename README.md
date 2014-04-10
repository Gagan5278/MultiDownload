MultiDownload
=============

Use this demo app for multiple request over server. Demo works on NSURLConnection for parllel request.
Use this demo for making multiple parallel request or multiple download. 
To use this demo import "MultipleDownload: .h & .m file into your project.
Implement following delegates method into your viewController

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

In ViewDidLoad on your viewController.m file add following code

 self.urlMutableArray = [NSMutableArray arrayWithObjects:@"https://itunes.apple.com/search?term=jack+johnson",@"https://itunes.apple.com/search?term=jack+johnson&limit=25",@"https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo",@"https://itunes.apple.com/search?term=jim+jones&country=ca",@"https://itunes.apple.com/search?term=yelp&country=us&entity=software",@"https://itunes.apple.com/lookup?amgArtistId=468749,5723",@"https://itunes.apple.com/lookup?amgArtistId=468749,5723&entity=song&limit=5&sort=recent", nil];
	self.downloads = [[MultipleDownload alloc] initWithUrls: self.urlMutableArray];
	self.downloads.delegate = self;
