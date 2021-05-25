#! /bin/bash

DATE=`date "+%Y_%m_%d_%H_%M_%S"`
tar -czvf  ~/Desktop/${DATE}.tar ./*

echo ""
echo "*** Back up success, go to ~/Desktop/${DATE}.tar ***"
echo ""
