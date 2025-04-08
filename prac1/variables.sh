#!/bin/bash

Var1=SomeContent
Var2="SomeContent"
Var3=3
Var4="3"
Var5="element1"
Var6="element 2"


echo $Var1
echo $Var2
echo $Var3
echo $Var4
echo $Var5
echo ${Var6}extended
echo $Var1$Var3
echo ${Var1}${Var3}
echo "The content of Var1 is: ${Var1}"
echo 'The content of Var1 is: ${Var1}'