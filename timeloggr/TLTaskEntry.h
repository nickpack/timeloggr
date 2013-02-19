//
//  TLTaskEntry.h
//  timeloggr
//
//  Created by Nick Pack on 18/02/2013.
//  Copyright (c) 2013 Nick Pack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLTaskEntry : NSObject

@property (readonly) BOOL billed;
@property (readonly) NSDate* createdAt;
@property (readonly) NSInteger ticketNumber;
@property (readonly) NSString* spaceId;
@property (readonly) NSDate* beginAt;
@property (readonly) NSString* url;
@property (readonly) NSString* description;
@property (readonly) NSDate* updatedAt;
@property (readonly) NSInteger jobAgreementId;
@property (readonly) NSString* userId;
@property (readonly) NSInteger ticketId;
@property (readonly) NSDate* endAt;
@property (readonly) NSDecimalNumber* hours;
@property (readonly) NSInteger entryId;

- (id)initWithAttributes:(NSDictionary *)attributes;
+ (void)taskEntriesWithBlock:(void (^)(NSArray *tasks, NSError *error))block;

@end
