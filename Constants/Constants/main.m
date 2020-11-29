//
//  main.m
//  Constants
//
//  Created by franklin smith on 8/2/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       //NSLog(@"Hello, World!");
        NSLog(@"\u03c0is %f", M_PI);
        NSLog(@"%d is larger", MAX(10,22));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"Money is %@", currency);
    }
    return 0;
}
