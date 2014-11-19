//
//  CiaranDAnagramContainer.m
//  anagrams
//
//  Created by Ciaran Downey on 9/3/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import "CiaranDAnagramContainer.h"
#import "Util.h"

@implementation CiaranDAnagramContainer

- (id) initWithCapacity:(NSInteger)capacity {
    self = [super init];

    anagrams = [[NSMutableDictionary alloc] initWithCapacity:capacity];

    return self;
}

- (NSDictionary*) anagrams {
    return anagrams;
}

- (NSInteger) lengthOfBiggestGroup {
    NSMutableArray *group = [self biggestGroup];

    if (group == nil) {
        return 0;
    }

    return [group count];
}

- (NSMutableArray*) biggestGroup {
    return [anagrams valueForKey:biggestHash];
}

// adds a word to the container
- (void) addWord:(NSString*)word {
    NSString *hash = [Util hashWord:[word lowercaseString]];

    NSMutableArray *group = [anagrams valueForKey:hash];

    if (group == nil) {
        group = [[NSMutableArray alloc] initWithCapacity:20];
    }

    [group addObject:word];
    if ([group count] > [self lengthOfBiggestGroup]) {
        biggestHash = hash;
    }

    [anagrams setValue:group forKey:hash];
}

@end
