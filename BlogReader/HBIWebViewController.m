//
//  HBIWebViewController.m
//  BlogReader
//
//  Created by Anton Rivera on 2/9/14.
//  Copyright (c) 2014 Hudson Boy Inc. All rights reserved.
//

#import "HBIWebViewController.h"

@interface HBIWebViewController ()

@end

@implementation HBIWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
	[self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
