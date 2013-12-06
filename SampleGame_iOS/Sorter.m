//
//  Sorter.m
//  SampleGame
//
//  Created by Carlotta Tatti on 03/12/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Sorter.h"

@implementation Sorter

+ (Sorter *)sharedInstance {
    static dispatch_once_t onceToken;
    static Sorter *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Sorter new];
    });
    return sharedInstance;
}

- (NSArray *)sortUsingQuickSort:(NSArray *)arrayToSort {
    if (arrayToSort.count <= 1)
        return arrayToSort;
    
    int pivotElementIndex = arc4random() % arrayToSort.count-1;
    NSNumber *pivotElement = arrayToSort[pivotElementIndex];
    NSMutableSet *partitionOne = [NSMutableSet new];
    NSMutableSet *partitionTwo = [NSMutableSet new];
    for (NSNumber *element in arrayToSort) {
        if ([element doubleValue] < [pivotElement doubleValue]) {
            [partitionOne addObject:element];
            [partitionOne addObject:pivotElement];
        }
        if ([element doubleValue ] > [pivotElement doubleValue]) {
            [partitionTwo addObject:element];
        }
        if ([element doubleValue] == [pivotElement doubleValue]) {
            [partitionTwo addObject:element];
        }
    }
    return [NSArray new];
}

- (NSArray *)sortUsingRadixSort:(NSArray *)arrayToSort {
    return [NSArray new];
}

@end
