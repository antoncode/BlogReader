//
//  HBITableViewController.m
//  BlogReader
//
//  Created by Anton Rivera on 2/6/14.
//  Copyright (c) 2014 Hudson Boy Inc. All rights reserved.
//

#import "HBITableViewController.h"
#import "AHRBlogPost.h"
#import "HBIWebViewController.h"

@interface HBITableViewController ()

@end

@implementation HBITableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    
    for (NSDictionary *bPDictionary in blogPostsArray) {
        AHRBlogPost *blogPost = [AHRBlogPost blogPostWithTitle:[bPDictionary objectForKey:@"title"]];
        blogPost.author = [bPDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bPDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bPDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bPDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    AHRBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]){
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
    
        cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", blogPost.author, [blogPost formattedDate]];
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showBlogPost"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AHRBlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

@end
