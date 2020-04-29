#! /bin/bash

isPartTime=1
isFullTime=2
empRatePerHr=20
randomCheck=$((RANDOM%3))

case $randomCheck in
         $isFullTime)
                empHrs=16
                 ;;
         $isPartTime) 
               empHrs=8
                ;;
         *)
         empHrs=0
          ;;
esac
salary=$(($empHrs*$empRatePerHr))
echo $salary