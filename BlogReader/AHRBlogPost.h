//
//  AHRBlogPost.h
//  BlogReader
//
//  Created by Anton Rivera on 2/8/14.
//  Copyright (c) 2014 Hudson Boy Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHRBlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

// Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *) title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;

@end
