//
//  PickableItemTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Item.h"

SPEC_BEGIN(ItemTests)
describe(@"The PickableItem class", ^{
    context(@"when created", ^{
        Item *item = [[Item alloc] init];
        it(@"is not nil", ^{
            [[item shouldNot] beNil];
        });
    });
});
SPEC_END