#! /bin/bash

isPartTime=1;
isFullTime=2
MaxHrsInMonth=100
empRatePerHr=20
numWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

while [[ $totalEmpHr -lt $MaxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
  ((totalWorkingDays++))
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

totalEmpHrs=$(($totalEmpHrs+$empHrs))

done

totalSalary=$(($totalEmpHrs*$empRatePerHr))

echo "Total Emp Hours" $totalEmpHrs
echo "Total Salary" $totalSalary