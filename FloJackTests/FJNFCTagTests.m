//
//  FJNDEFTests.m
//  FJNDEFTests
//
//  Created by John Bullard on 9/21/12.
//  Copyright (c) 2012 Flomio Inc. All rights reserved.
//

#import "FJNFCTagTests.h"
#import "NSData+FJStringDisplay.h"

@implementation FJNFCTagTests

@synthesize tagTestData = _tagTestData;

- (void)setUp
{
    [super setUp];
    self.tagTestData = [[NSMutableArray alloc] initWithCapacity:2];
    
    /**
     Test 1:
     IC: KOVIO 256
     NDEF:
        TNF = TNF_WELL_KNOWN (0x01), RTD = RTD_URI (0x55)
        Payload = "http://flomio.com/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio/flomio0"
     */
    int uidLengthT1 = 7;
    int dataLengthT1 = 256;
    UInt8 dataT1[] = {
        0x37, 0x07, 0x79, 0xC1,
        0x73, 0x57, 0x4E, 0xD4,
        0xBE, 0x07, 0xF8, 0xFF,
        0xE1, 0x10, 0x1D, 0x0F,
        0x03, 0xA2, 0xD1, 0x01,
        0x9E, 0x55, 0x03, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2E, 0x63, 0x6F,
        0x6D, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0x2F, 0x66, 0x6C, 0x6F,
        0x6D, 0x69, 0x6F, 0x2F,
        0x66, 0x6C, 0x6F, 0x6D,
        0x69, 0x6F, 0x2F, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0x2F, 0x66, 0x6C, 0x6F,
        0x6D, 0x69, 0x6F, 0x2F,
        0x66, 0x6C, 0x6F, 0x6D,
        0x69, 0x6F, 0x2F, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0x2F, 0x66, 0x6C, 0x6F,
        0x6D, 0x69, 0x6F, 0x2F,
        0x66, 0x6C, 0x6F, 0x6D,
        0x69, 0x6F, 0x2F, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0x2F, 0x66, 0x6C, 0x6F,
        0x6D, 0x69, 0x6F, 0x2F,
        0x66, 0x6C, 0x6F, 0x6D,
        0x69, 0x6F, 0x2F, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0x2F, 0x66, 0x6C, 0x6F,
        0x6D, 0x69, 0x6F, 0x2F,
        0x66, 0x6C, 0x6F, 0x6D,
        0x69, 0x6F, 0x2F, 0x66,
        0x6C, 0x6F, 0x6D, 0x69,
        0x6F, 0x2F, 0x66, 0x6C,
        0x6F, 0x6D, 0x69, 0x6F,
        0xFE, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00,
        0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0x3F, 0x00, 0x00 };
    
    NSData *tagUIDT1 = [[NSData alloc] initWithBytes:dataT1 length:uidLengthT1];
    NSData *tagDataT1 = [[NSData alloc] initWithBytes:dataT1 length:dataLengthT1];
    NSNumber *tagTypeT1 = [NSNumber numberWithInt:NFC_FORUM_TYPE_2];
    NSNumber *tagNDEFTLVLocationT1 = [NSNumber numberWithInt:16];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                tagUIDT1,               @"tagUid",
                                tagDataT1,              @"tagData",
                                tagTypeT1,              @"tagType",
                                tagNDEFTLVLocationT1,   @"tagNDEFTLVLocation",
                                nil];
    [self.tagTestData addObject:dict];
    
}

- (void)testFJNFCTagType2DataDecoding
{
    for(id item in self.tagTestData) {
        NSData *tagUID = [item objectForKey:@"tagUid"];
        NSData *tagData = [item objectForKey:@"tagData"];
        NSNumber *tagType = [item objectForKey:@"tagType"];
        NSNumber *tagNDEFTLVLocation = [item objectForKey:@"tagNDEFTLVLocation"];
        
        FJNFCTag *tag = [[FJNFCTag alloc] initWithUid:tagUID andData:tagData andType:tagType.intValue];
        
        STAssertTrue(([tag type2ParseMemoryForNdefTLVLocation] == tagNDEFTLVLocation.intValue)
                     , @"NDEF TLV location incorrect.");
    }
}

- (void)tearDown
{
    [super tearDown];
}

@end
