//
//  TLAssemblaAPIClient.h
//  timeloggr
//
//  Created by Nick Pack on 04/02/2013.
//  Copyright (c) 2013 Nick Pack. All rights reserved.
//

#import "AFHTTPClient.h"

@interface TLAssemblaAPIClient : AFHTTPClient

+ (TLAssemblaAPIClient *)sharedClient;

@end
