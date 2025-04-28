#include <iostream>
#include <boost/thread/thread.hpp>
#include <MyLibrary.h>

void hello()
{
    std::cout << "Hello World!" << std::endl;
}

int main()
{
    hello();

    return 0;
}