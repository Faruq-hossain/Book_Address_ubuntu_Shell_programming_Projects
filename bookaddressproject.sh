#!/bin/bash


#create algorithm program
create()
{

echo "Enter adddress book name"
read ab
res=`ls | grep $ab | wc -w`

if [ $res -gt 0 ]
then
echo "Error: file is already existing!"
else
touch $ab
echo "Address Book Created!"
fi
}


#display algorithm program

display()
{

echo "Enter adddress book name"
read ab
res=`ls | grep $ab | wc -w`

if [ $res -gt 0 ]
then
cat $ab #present file show cat command
else
echo "Error: file is not present!"
fi
}

#insert algorithm program

insert()
{

echo "Enter adddress book name"
read ab
res=`ls | grep $ab | wc -w`

if [ $res -gt 0 ]
then
echo "Enter email"
read email
#check email is present in address book or not
len=`cat $ab | grep $email | wc -w`
if [ $len -gt 0 ]
then
echo "Error: Email already existing"
else
echo "Enter First name, Last name, mobile number"
read fname lname mobile
record=`echo $fname $lname $email $mobile`
echo $record >> $ab
echo "Record Inserted"
fi
else
echo "Error: file is not present!"
fi
}


#modify algorithm program

modify()
{

echo "Enter adddress book name"
read ab
res=`ls | grep $ab | wc -w`

if [ $res -gt 0 ]
then
echo "Enter email"
read email
#check email is present in address book or not
len=`cat $ab | grep $email | wc -w`
if [ $len -gt 0 ]
then
echo "Enter Modified First name, Last name, mobile"
read fname lanme mobile
new=`echo $fname $lname $email $mobile`
old=`cat $ab | grep $email`

echo "Old Record: $old"
echo "New Record:$new"
sed -i s/"$old"/"$new"/g $ab

echo "record Modified!"
else
echo "Error: Email is not existing"
fi
else
echo "Error: file is not present!"
fi
}


#delete algorithm program

delete()
{

echo "Enter adddress book name"
read ab
res=`ls | grep $ab | wc -w`

if [ $res -gt 0 ]
then
echo "Enter email"
read email
#check email is present in address book or not
len=`cat $ab | grep $email | wc -w`
if [ $len -gt 0 ]
then

old=`cat $ab | grep $email`

sed -i s/"$old"//g $ab
sed -i /^$/d $ab #delete blank line
echo "record Deleted!!"
else
echo "Error: Email is not existing"
fi
else
echo "Error: file is not present!"
fi
}



while [ true ]
do
echo
echo "************************************************************"
echo
echo "                      OUR BOOK ADDRESS PROJECT              "
echo
echo "************************************************************"
echo "************************************************************"
echo
echo "                      MENU BAR                              "
echo
echo "************************************************************"
echo "                      1. Create"
echo "                      2. Display"
echo "                      3. Insert Record"
echo "                      4. modify Record"
echo "                      5. Delete Record"
echo "                      7. Exit"

echo "Enter Choice"
read choice

case $choice in
1) create ;;
2) display ;;
3) insert ;;
4) modify ;;
5) delete ;;
7) exit ;;
*) echo "Wrong Choice!" ;;

esac

done 
