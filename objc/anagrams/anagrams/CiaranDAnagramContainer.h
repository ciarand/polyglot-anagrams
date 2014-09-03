//
//  CiaranDAnagramContainer.h
//  anagrams
//
//  Created by Ciaran Downey on 9/3/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CiaranDAnagramContainer : NSObject {
    NSMutableDictionary *anagrams;
    NSString *biggestHash;
}

- (id) initWithCapacity:(NSInteger)capacity;

- (NSMutableDictionary*) anagrams;

- (NSInteger) lengthOfBiggestGroup;

- (NSMutableArray*) biggestGroup;

- (void) addWord:(NSString*)word;

@end
