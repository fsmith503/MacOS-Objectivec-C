//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by franklin smith on 11/29/20.
//

#import "NSString+BNRVowelCounting.h"

@implementation NSString (BNRVowelCounting)

- (int)bnr_vowelCount{
    NSCharacterSet *charSet=
    [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSUInteger count = [self length];
    int sum = 0;
    for (int i = 0; i < count; i++){
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]){
            sum++;
        }
    }
    return sum;
}

@end
