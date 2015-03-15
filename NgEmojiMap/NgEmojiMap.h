//
//  NgEmojiMap.h
//  NgEmojiMap
//
//  Created by Meiwin Fu on 4/2/15.
//  Copyright (c) 2015 meiwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NgEmojiMap : NSObject
+ (instancetype)sharedInstance;
- (NSString *)emojiForAlias:(NSString *)alias;
- (NSString *)aliasForEmoji:(NSString *)unicode;
- (NSCharacterSet *)characterSet;
@end
