//
//  HBIWebViewController.h
//  BlogReader
//
//  Created by Anton Rivera on 2/9/14.
//  Copyright (c) 2014 Hudson Boy Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBIWebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
