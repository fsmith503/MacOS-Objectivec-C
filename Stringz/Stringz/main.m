//
//  main.m
//  Stringz
//
//  Created by franklin smith on 8/2/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++){
            [str appendString:@"Aaron is cool!\n"];
        }
        
        // Declare a pointer to an NSError object, but not instantiate it
        // The NSError isntance will only be created if there is, in fact an error.
        NSError *error;
        
        //Pass the NSError pointer by reference to the NSString method
        BOOL success = [str writeToFile:@"/tmp/idk/cool.txt"
                atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        //Test the returned BOOL, and query the NSError if the write failed
        if (success){
            NSLog(@"done writing /tmp/cool.txt");
        }
        else{
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
        }
    return 0;
    }
}
