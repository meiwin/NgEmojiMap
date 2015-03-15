//
//  NgEmojiMapTests.m
//  NgEmojiMap
//
//  Created by Meiwin Fu on 15/3/15.
//  Copyright (c) 2015 Meiwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NgEmojiMap.h"

@interface NgEmojiMapTests : XCTestCase

@end

@implementation NgEmojiMapTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmojiMapping
{
  XCTAssertEqualObjects(@"😃", [[NgEmojiMap sharedInstance] emojiForAlias:@"smiley"]);
  XCTAssertEqualObjects(@"smiley", [[NgEmojiMap sharedInstance] aliasForEmoji:@"😃"]);
  BOOL isMember = [(@"😃") rangeOfCharacterFromSet:[[NgEmojiMap sharedInstance] characterSet]].location != NSNotFound;
  XCTAssert(isMember);
  isMember = [(@"a") rangeOfCharacterFromSet:[[NgEmojiMap sharedInstance] characterSet]].location != NSNotFound;
  XCTAssert(!isMember);
}
@end
