//
//  TLTaskEntry.m
//  timeloggr
//
//  Created by Nick Pack on 18/02/2013.
//  Copyright (c) 2013 Nick Pack. All rights reserved.
//

#import "TLTaskEntry.h"
#import "TLAssemblaAPIClient.h"

@implementation TLTaskEntry

@synthesize billed = _billed;
@synthesize createdAt = _createdAt;
@synthesize ticketNumber = _ticketNumber;
@synthesize spaceId = _spaceId;
@synthesize beginAt = _beginAt;
@synthesize url = _url;
@synthesize description = _description;
@synthesize updatedAt = _updatedAt;
@synthesize jobAgreementId = _jobAgreementId;
@synthesize userId = _userId;
@synthesize ticketId = _ticketId;
@synthesize endAt = _endAt;
@synthesize hours = _hours;
@synthesize entryId = _entryId;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _billed = [[attributes valueForKeyPath:@"billed"] boolValue];
    //_createdAt = [attributes valueForKeyPath:@"created_at"];
    _ticketNumber = [[attributes valueForKeyPath:@"ticket_number"] integerValue];
    _spaceId = [attributes valueForKeyPath:@"space_id"];
    //_beginAt = [attributes valueForKeyPath:@"begin_at"];
    _url = [attributes valueForKeyPath:@"url"];
    _description = [attributes valueForKeyPath:@"description"];
    //_updatedAt = [attributes valueForKeyPath:@"updated_at"];
    _jobAgreementId = [[attributes valueForKeyPath:@"job_agreement_id"] integerValue];
    _userId = [attributes valueForKeyPath:@"user_id"];
    _ticketId = [[attributes valueForKeyPath:@"ticket_id"] integerValue];
    //_endAt = [attributes valueForKeyPath:@"end_at"];
    _hours = [NSDecimalNumber decimalNumberWithDecimal:[[attributes valueForKeyPath:@"hours"] decimalValue]];
    _entryId = [[attributes valueForKeyPath:@"id"] integerValue];
    
    return self;
}

+ (void)taskEntriesWithBlock:(void (^)(NSArray *tasks, NSError *error))block {
    [[TLAssemblaAPIClient sharedClient] getPath:@"tasks.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSArray *entriesFromResponse = JSON;
        NSMutableArray *mutableEntries = [NSMutableArray arrayWithCapacity:[entriesFromResponse count]];
        for (NSDictionary *attributes in entriesFromResponse) {
            TLTaskEntry *entry = [[TLTaskEntry alloc] initWithAttributes:attributes];
            [mutableEntries addObject:entry];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableEntries], nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"FAIL");
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
