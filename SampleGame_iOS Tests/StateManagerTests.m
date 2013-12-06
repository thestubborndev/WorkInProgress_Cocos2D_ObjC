//
//  StateManagerTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 30/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "StateManager.h"

SPEC_BEGIN(StateManagerTests)
describe(@"The State Manager", ^{
    context(@"after setting 'aValue' for the key 'aKey'", ^{
        [[StateManager sharedInstance] setMeta:@"aValue" forKey:@"aKey"];
        pending(@"returns 'aValue' for 'aKey'", ^{

        });
    });
    
    context(@"after setting nil for the key 'aKey'", ^{
        [[StateManager sharedInstance] setMeta:nil forKey:@"aKey"];
        pending(@"returns nil for 'aKey'", ^{

        });
    });
});
SPEC_END
