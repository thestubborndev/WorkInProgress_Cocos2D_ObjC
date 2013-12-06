//
//  Inventory.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface Inventory : NSObject

@property (strong, nonatomic) NSMutableArray *items;

- (void)addItem:(Item *)item;
- (void)removeItem:(Item *)item;
- (void)empty;

@end
