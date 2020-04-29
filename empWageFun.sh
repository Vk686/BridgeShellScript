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
while [[ $totalWorkHours -lt $MaxHrsInMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
  (( totalWorkingDays++ ))
  workHours="$( getWorkingHours $((RANDOM%3)) )"
  totalWorksHours=$(( totalWorkHours + workHours ))

done

totalSalary=$(( totalWorkingHours * empRatePerHr ))

echo "Total WorkHours" $totalWorksHours