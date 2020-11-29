//
//  BNRAsset.m
//  Object Instance
//
//  Created by franklin smith on 8/2/20.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void)dealloc{
    NSLog(@"deallocating %@", self);
}

@end
