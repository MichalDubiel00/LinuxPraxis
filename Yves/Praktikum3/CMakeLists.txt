cmake_minimum_required(VERSION 3.1)
project(hello_world)
set(CMake_CXX_STANDARD 17)

#### 3.2 - 3.5 ####
#set(HelloWorldSources    src/hello_world.cpp    
#                         src/MyLibrary.cpp)
#set(HelloWorldHeaders    include/MyLibrary.h)
#find_package(Boost REQUIRED COMPONENTS system thread)
#add_executable(hello_world ${HelloWorldSources} ${HelloWorldHeaders})
#target_include_directories(hello_world PRIVATE include)
#target_link_libraries(hello_world Boost::thread Boost::system)



#### 3.6 ####
set(MyLibrayHeaders     include/MyLibrary.h)
set(MyLibraySources     src/MyLibrary.cpp)

set(HelloWorldSources src/hello_world.cpp)

add_library(mylibrary SHARED ${MyLibraySources} ${MyLibrayHeaders})

target_include_directories(mylibrary PUBLIC include)

add_executable(hello_world ${HelloWorldSources})

target_link_libraries(hello_world       PRIVATE Boost::thread Boost::system
                                        PRIVATE mylibrary)