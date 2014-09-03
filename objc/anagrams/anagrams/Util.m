//
//  Util.m
//  anagrams
//
//  Created by Ciaran Downey on 9/1/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import "Util.h"

@implementation Util

// http://stackoverflow.com/questions/13359410/sort-characters-in-nsstring-into-alphabetical-order
+ (NSString*) hashWord:(NSString*)word {
    NSString *sanitized = [word lowercaseString];

    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:sanitized.length];

    for (int i = 0; i < sanitized.length; i += 1) {
        NSString *charStr = [sanitized substringWithRange:NSMakeRange(i, 1)];
        [charArray addObject:charStr];
    }

    [charArray sortUsingComparator:^(NSString *a, NSString *b){
        return [a compare:b];
    }];

    return [charArray componentsJoinedByString:@""];
}

+ (NSArray*) getWordsFromFile:(const char*)arg {
    return [[NSString stringWithContentsOfFile:
             [NSString stringWithCString:arg encoding:NSUTF8StringEncoding]
                                      encoding:NSUTF8StringEncoding error:nil]
            componentsSeparatedByString:@"\n"];
}

@end
