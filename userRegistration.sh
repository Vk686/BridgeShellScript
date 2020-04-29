#!/bin/bash

echo "enter First Name"
read firstname
pattern1="^[A-Z][a-zA-Z]{3,}$"
if [[ $firstname =~ $pattern1 ]]
then
echo "Valid First Name"
else
echo "Invalid First Name"
fi

echo "enter LastName"
read lastname
pattern2="^[A-Z][a-zA-Z]{3,}$"
if [[ $lastname =~ $pattern2 ]]
then
echo "Valid Last Name"
else
echo "Invalid Last Name"
fi

echo "enter email-id"
read email
pattern3="^([a-zA-Z]+[a-zA-Z0-9]*((\_|\-|\.|\+)?[[a-zA-Z0-9]+))@([a-zA-Z0-9]+)+(\.([a-zA-Z]{2}[a-zA-Z]*))+$"
if [[ $email =~ $pattern3 ]]
then
echo "Valid Email Id"
else
echo "Invalid Email Id"
fi

echo "enter MobileNumber"
read mobile
pattern4="^(0|91)[ ]([0-9]{10})$"
if [[ $mobile =~ $pattern4 ]]
then
echo "Valid Mobile Number"
else
echo "Invalid Mobile Number"
fi

echo "enter Password"
read password
pattern5="([a-zA-Z0-9@#$%]){8,}"
if [[ $password =~ $pattern5 ]]
then
echo "Valid Password"
else
echo "Invalid Password"
fi

echo "First Name="$firstname
echo "Last Name="$lastname
echo "Email-Id="$email
echo "Mobile Number="$mobile
echo "Password="$password
