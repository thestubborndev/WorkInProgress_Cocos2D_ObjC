//
//  Inventory.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Inventory.h"

@implementation Inventory

- (id)init {
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addItem:(Item *)item {
    [_items addObject:item];
}

- (void)removeItem:(Item *)item {
    [_items removeObject:item];
}

- (void)empty {
    [_items removeAllObjects];
}

- (NSUInteger)count {
    return _items.count;
}

@end
