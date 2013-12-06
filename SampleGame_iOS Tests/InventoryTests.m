//
//  InventoryTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Inventory.h"
#import "Item.h"

SPEC_BEGIN(InventoryTests)
describe(@"The inventory", ^{
    context(@"when created", ^{
        Inventory *inventory = [[Inventory alloc] init];
        it(@"is not nil", ^{
            [[inventory shouldNot] beNil];
        });
        it(@"is empty.", ^{
            [[inventory should] beEmpty];
        });
    });
});
SPEC_END
