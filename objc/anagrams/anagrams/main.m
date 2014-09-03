//
//  main.m
//  anagrams
//
//  Created by Ciaran Downey on 9/1/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//
// how do I change this header? why are there 2 spaces in the beginning
//

#import <Foundation/Foundation.h>
#import "Util.h"
#import "CiaranDAnagramContainer.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        if (argc < 2) {
            printf("You need to provide a file to use as the words list");
            exit(1);
        }

        NSArray *lines = [Util getWordsFromFile:argv[argc - 1]];

        u_long len = [lines count];

        CiaranDAnagramContainer *container = [[CiaranDAnagramContainer alloc] initWithCapacity:len];

        for (u_long i = 0; i < len; i += 1) {
            [container addWord:lines[i]];
        }

        NSInteger biggestLength = [container lengthOfBiggestGroup];
        NSLog(@"The largest number of anagrams is %ld", (long)biggestLength);

        NSMutableDictionary *anagrams = [container anagrams];
        NSMutableArray *arr;

        for (NSString *key in anagrams) {
            arr = [anagrams valueForKey:key];

            if ([arr count] == biggestLength) {
                printf("[%s]", [[arr componentsJoinedByString:@" "] cStringUsingEncoding:NSUTF8StringEncoding]);
            }
        }
    }
    return 0;
}
