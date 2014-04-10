//
//  ViewController.h
//  MultiDiwnload
//
//  Created by Gagan on 10/04/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultipleDownload.h"
@interface ViewController : UIViewController<DownloadData>
@property(nonatomic,retain)NSMutableArray *urlMutableArray;
@property(nonatomic,retain)MultipleDownload *downloads;
- (IBAction)StartButtonPessed:(id)sender;
@end
