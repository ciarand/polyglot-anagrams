//
//  main.m
//  anagrams
//
//  Created by Ciaran Downey on 9/1/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
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

        if (len < 1) {
            printf("Problem opening provided file");
            exit(1);
        }

        CiaranDAnagramContainer *container = [[CiaranDAnagramContainer alloc] initWithCapacity:len];

        for (u_long i = 0; i < len; i += 1) {
            [container addWord:lines[i]];
        }

        NSInteger biggestLength = [container lengthOfBiggestGroup];
        printf("The largest number of anagrams is %ld\n", (long)biggestLength);

        NSDictionary *anagrams = [container anagrams];
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
