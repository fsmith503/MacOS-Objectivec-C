//
//  main.c
//  gradeInTheShade
//
//  Created by franklin smith on 11/29/20.
//

#include <stdio.h>
#include <stdlib.h> // malloc(), free()



float averageFloats(float *data, int dataCount){
    float sum = 0.0;
    for(int i = 0; i < dataCount; i++){
        sum = sum + data[i];
    }
    return sum / dataCount;
}



int main(int argc, const char * argv[]) {
    // insert code here...
    //printf("Hello, World!\n");
    
    // create an array of floats
    //float *gradeBook = malloc(3 * sizeof(float));
    
    //float gradeBook[3];
    
    float gradeBook[] = {60.2, 94.5, 81.1};
    gradeBook[0] = 60.2;
    gradeBook[1] = 94.5;
    gradeBook[2] = 81.1;
    
    //calculate the average
    float average = averageFloats(gradeBook, 3);
    
    //free the array
    //free(gradeBook);
    //gradeBook = NULL;
    
    printf("Average = %.2f\n", average);
    
    return 0;
    
    
    
    return 0;
}
