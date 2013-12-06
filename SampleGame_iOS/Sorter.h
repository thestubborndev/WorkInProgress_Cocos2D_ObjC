//
//  Sorter.h
//  SampleGame
//
//  Created by Carlotta Tatti on 03/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sorter : NSObject

+ (Sorter *)sharedInstance;

- (NSArray *)sortUsingQuickSort:(NSArray *)arrayToSort;

- (NSArray *)sortUsingRadixSort:(NSArray *)arrayToSort;

@end
