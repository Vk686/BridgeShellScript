#! /bin/bash
isPersent=1;
randomCheck=$((RANDOM%2))

if [ $isPersent -eq $randomCheck ]
then
      echo "Employee is Persent"
else
      echo "Employee is Absent"
fi