#! /bin/bash

isPresent=1;
randomCheck=$((RANDOM%2))

if [ $isPresent -eq $randomCheck ]
then 
         wagePerHr=20;
         fullDayHrs=8;
         salary=$(( $wagePerHr*$fullDayHrs)) 
   else
      salary=0;
fi
echo "Daily Wage of an Employee= " $salary