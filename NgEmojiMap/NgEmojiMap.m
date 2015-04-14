//
//  NgEmojiMap.h
//  NgEmojiMap
//
//  Created by Meiwin Fu on 4/2/15.
//  Copyright (c) 2015 meiwin. All rights reserved.
//

#import "NgEmojiMap.h"

@interface NgEmojiMap ()
{
  NSDictionary * _unicodeToAliasMapping;
  NSDictionary * _aliasToUnicodeMapping;
  NSCharacterSet * _characterSet;
}
@end
@implementation NgEmojiMap
+(instancetype)sharedInstance
{
  static NgEmojiMap * _sharedInstance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[NgEmojiMap alloc] init];
  });
  return _sharedInstance;
}
- (instancetype)init
{
  self = [super init];
  if (self)
  {
    [self loadMapping];
  }
  return self;
}
- (void)loadMapping
{
  NSBundle * bundle = [NSBundle bundleForClass:[self class]];
  NSURL * gemojiJsonURL = [bundle URLForResource:@"NgEmojiMap.bundle/gemoji" withExtension:@"json"];
  NSData * gemojiData = [NSData dataWithContentsOfURL:gemojiJsonURL];
  NSError * error = nil;
  NSArray * emojis = [NSJSONSerialization JSONObjectWithData:gemojiData options:0 error:&error];
  NSMutableDictionary * unicodeToAliasMapping = [NSMutableDictionary dictionary];
  NSMutableDictionary * aliasToUnicodeMapping = [NSMutableDictionary dictionary];
  [emojis enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL *stop) {
    NSString * unicode = dict[@"emoji"];
    if (!unicode) return;
    NSArray *aliases = dict[@"aliases"];
    if (aliases.count == 0) return;
    for (NSString *alias in aliases) {
      if (!unicodeToAliasMapping[unicode]) {
        unicodeToAliasMapping[unicode] = alias;
      }
      aliasToUnicodeMapping[alias] = unicode;
    }
  }];
  
  _unicodeToAliasMapping = [unicodeToAliasMapping copy];
  _aliasToUnicodeMapping = [aliasToUnicodeMapping copy];
  _characterSet = [NSCharacterSet characterSetWithCharactersInString:[[_unicodeToAliasMapping allKeys] componentsJoinedByString:@""]];
}
- (NSString *)emojiForAlias:(NSString *)alias
{
  return _aliasToUnicodeMapping[alias];
}
- (NSString *)aliasForEmoji:(NSString *)emoji
{
  return _unicodeToAliasMapping[emoji];
}
- (NSCharacterSet *)characterSet
{
  return _characterSet;
}
@end
