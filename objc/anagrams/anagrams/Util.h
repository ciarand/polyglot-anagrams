//
//  Util.h
//  anagrams
//
//  Created by Ciaran Downey on 9/1/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
+ (NSString*) hashWord:(NSString*)word;
+ (NSArray*) getWordsFromFile:(const char*)arg;
@end
