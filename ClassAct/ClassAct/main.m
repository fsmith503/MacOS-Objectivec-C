//
//  main.m
//  ClassAct
//
//  Created by franklin smith on 11/29/20.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


NSArray *BNRHierarchyForClass(Class cls){
    //Declare an array to hodl the list of
    // this class and all its superclasses, building a hierarchy
    NSMutableArray *classHierarchy = [NSMutableArray array];
    // keep climbing the class hierarcy until we get to a class with no superclass
    for(Class c = cls; c!= Nil; c = class_getSuperclass(c)){
        NSString *className = NSStringFromClass(c);
        [classHierarchy insertObject:className atIndex:0];
    }
    return classHierarchy;
}


NSArray *BNRMethodsForClass(Class cls){
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(cls, &methodList);
    NSMutableArray *methodArray = [NSMutableArray array];
    
    for (int m = 0; m < methodCount; m++){
        // get the current method
        Method currentMethod = methodList[m];
        // get the selector for the current mehtod
        SEL methodSelector = method_getName(currentMethod);
        // add its string representation to the array
        [methodArray addObject:NSStringFromSelector(methodSelector)];
    }
    return methodArray;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //create an array of dictionaries, where each dictionary
        // will end up holding the class name, hierarchy and mehthod list for a given class
        NSMutableArray *runtimeClassesInfo = [NSMutableArray array];
        // insert code here...
        // Declare a variable to hold the number of registered NSLoadedClasses
        unsigned int classCount = 0;
        //get a pointer to a list of all registered classes
        //currently loaded by your applicaiton.
        //the number of registered classes is returned by reference
        Class *classList = objc_copyClassList(&classCount);
        //for each class in the list...
        for(int i = 0; i < classCount; i++){
            // treat the classlist as a c array to get a class from it
            Class currentClass = classList[i];
            // get the class's name as a string
            NSString *className = NSStringFromClass(currentClass);
            // Log the class's name
            // NSLog(@"%@", className);
            NSArray *hierarchy = BNRHierarchyForClass(currentClass);
            NSArray *methods = BNRMethodsForClass(currentClass);
            NSDictionary *classInfoDict = @{ @"classname" : className,
                                             @"hierarchy" : hierarchy,
                                             @"methods" : methods };
            [runtimeClassesInfo addObject:classInfoDict];
        }
        //were dont with the class list buffer, so free it
        free(classList);
        //sort the classes info array alphabetically by name and log it.
        NSSortDescriptor *alphaAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sortedArray = [runtimeClassesInfo sortedArrayUsingDescriptors:@[alphaAsc]];
        NSLog(@"There are %ld classes registered with this program's Runtime.", sortedArray.count);
        NSLog(@"%@", sortedArray);
    }
    return 0;
}
