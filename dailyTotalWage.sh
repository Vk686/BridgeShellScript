#! /bin/bash
isPartTime=1;
isFullTime=2
MaxHrsInMonth=100
empRatePerHr=20
numWorkingDays=20

totalWorkHours=0
totalWorkingDays=0

function getWorkingHours(){
case $1 in
     $isFullTime)
          workHours=16
           ;;
     $isPartTime)
          workHours=8
           ;;
     *)
         workHours=0
           ;;
  esac
  echo $workHours
}

function calcDailyWage(){
local workHrs=$1
wage=$(($workHrs*$empRatePerHr))
echo $wage
}
while [[ $totalWorkHours -lt $MaxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
  ((totalWorkingDays++))
  workHours="$( getWorkingHours $((RANDOM%3)) )"
  totalWorksHours=$(($totalWorkHours+$workHours))
  empDailyWage[$totalWorkingDays]="$( calcDailyWage $workHours )"
done

totalSalary="$( calcDailyWage $totalWorkHours )"
echo "Daily Wage " ${empDailyWage[@]}
