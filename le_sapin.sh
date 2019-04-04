#!/bin/bash

nbr_star=1
row_max=4
sapin_space_max=3
big_space=0
trunk_space=0

display_star ()
{
tmp_row=0
tmp_star=0
tmp_big_space=0

while test $tmp_row != $row_max 
do
    while test $tmp_big_space -lt $big_space
    do
       echo -e  " \c"
       tmp_big_space=$(($tmp_big_space + 1))
   done
    tmp_big_space=0
    big_space=$(($big_space - 1))
   while test $tmp_star != $nbr_star
   do
       echo -e "*\c"
       tmp_star=$(($tmp_star + 1))
   done
   echo -e ""
   tmp_star=0
   tmp_row=$(($tmp_row + 1))
   nbr_star=$(($nbr_star + 2))
done
big_space=$(($big_space + 2)) 
row_max=$(($row_max + 1))
nbr_star=$(($nbr_star - 4))
}

count_big_space()
{
tmp_row=0
tmp_star=0
tmp_sapin_space=0

while test $tmp_row != $row_max
do
    while test $tmp_sapin_space != $sapin_space_max
    do
       tmp_sapin_space=$(($tmp_sapin_space + 1))
   done
   while test $tmp_star != $nbr_star
   do
       tmp_star=$(($tmp_star + 1))
   done
   tmp_sapin_space=0
   sapin_space_max=$(($sapin_space_max - 1))
   tmp_star=0
   tmp_row=$(($tmp_row + 1))
   nbr_star=$(($nbr_star + 2))
done
row_max=$(($row_max + 1))
nbr_star=$(($nbr_star - 4))
sapin_space_max=$(($row_max - 1))
}

the_trunk ()
{
floor=0
stick=0
space=0
less=$(($1 - 1))
less=$(($less / 2))

trunk_space=$(($trunk_space - $less))
while test $floor != $1
do
    while test $space -lt $trunk_space
    do
	echo -e " \c"
	space=$(($space + 1))
    done
   while test $stick != $1
    do
	echo -e "|\c"
	stick=$(($stick + 1))
    done
    echo ""
    space=0
    stick=0
    floor=$(($floor + 1))
done
}

le_sapin ()
{
floor=0

while test $floor != $1
do
    count_big_space
    floor=$(($floor + 1))
done
nbr_star=$(($nbr_star + 1))
big_space=$(($nbr_star / 2))
trunk_space=$big_space
nbr_star=1
row_max=4
floor=0
while test $floor != $1
do 
    display_star
    floor=$(($floor + 1))
done
the_trunk $1
}

if [[ "${1}" =~ ^[-+]?[0-9]+$ ]]
then
  le_sapin $1
else
  echo "Only Number : [sh le_sapin.sh nombre]"
fi
