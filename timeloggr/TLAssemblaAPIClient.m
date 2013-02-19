//
//  TLAssemblaAPIClient.m
//  timeloggr
//
//  Created by Nick Pack on 04/02/2013.
//  Copyright (c) 2013 Nick Pack. All rights reserved.
//

#import "TLAssemblaAPIClient.h"

#import "AFJSONRequestOperation.h"

static NSString * const kAFAssemblaAPIBaseURLString = @"https://api.assembla.com/v1/";

@implementation TLAssemblaAPIClient

+ (TLAssemblaAPIClient *)sharedClient {
    static TLAssemblaAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[TLAssemblaAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAFAssemblaAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
