//
//  Util.m
//  anagrams
//
//  Created by Ciaran Downey on 9/1/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (NSString*) hashWord:(NSString*)word {
    NSUInteger length = [word length];
    unichar cString[length];
    [word getCharacters:cString range:NSMakeRange(0, length)];

    qsort_b(cString, length, sizeof(unichar), ^(const void* left, const void* right) {
        return *(unichar*) left < *(unichar*) right;
    });

    return [NSString stringWithCharacters:cString length:length];
}

+ (NSArray*) getWordsFromFile:(const char*)arg {
    return [[NSString stringWithContentsOfFile:
             [NSString stringWithCString:arg encoding:NSUTF8StringEncoding]
                                      encoding:NSUTF8StringEncoding error:nil]
            componentsSeparatedByString:@"\n"];
}

@end
