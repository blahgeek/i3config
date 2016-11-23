/// @file setled.c  @date 11/07/2016
/// @author i@BlahGeek.com

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char * argv[]){
    int console = open("/dev/console", O_RDONLY);
    if (console <= 0)
        return 1;
    dup2(console, 0);
    return execv("/usr/bin/setleds", argv);
}

