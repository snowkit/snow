

#include "libs/stb_image/stb_image.h"
 

void image_compile_test() {
    int x,y,n;
    unsigned char *data = stbi_load("test.png", &x, &y, &n, 0);
    stbi_image_free(data);
}