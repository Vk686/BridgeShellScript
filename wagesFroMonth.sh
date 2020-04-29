#! /bin/bash

isPartTime=1
isFullTime=2
totalSalary=0
empRatePerHr=20
numWorkingDay=20

for (( day=1; day<=numWorkingDay; day++ ))
do
  empCheck=$((RANDOM%3))
    case $empCheck in
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

    salary=$(( empHrs * empRatePerHr ))
    totalSalary=$(( totalSalary + salary )) 
done 
echo $salary
echo $totalSalary