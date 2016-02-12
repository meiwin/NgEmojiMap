[![Build Status](https://travis-ci.org/meiwin/NgEmojiMap.svg)](https://travis-ci.org/meiwin/NgEmojiMap)

# NgEmojiMap

A simple objective-c class that encapsulates emoji-alias mapping (mapping from github/gemoji).

## Adding to your project

If you are using CocoaPods, add to your Podfile:

```ruby
pod NgEmojiMap
```

To manually add to your projects:

1. Add `NgEmojiMap.h`, `NgEmojiMap.m` and `NgEmojiMap.bundle` to your project.

`NgEmojiMap` requires ARC.

## Usage

```objective-c
// print smiley emoji
NSLog(@"%@", [[NgEmojiMap sharedInstance] emojiForAlias:@"smiley"]);
```
