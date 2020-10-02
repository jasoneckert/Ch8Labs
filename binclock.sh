#!/bin/bash
#The clock will be set up with the switches in the following setup.
#     HR8     MR8     SR8
#     HR4 ML4 MR4 SL4 SR4
# HL2 HR2 ML2 MR2 SL2 SR2
# HL1 HR1 ML1 MR1 SL1 SR1

while :
do
  HOUR=`date +%H`
  MIN=`date +%M`
  SEC=`date +%S`
  # Figure out if the hour is 20 or more HL2
  if [ $HOUR -ge 20 ]
  then
    HL2=1
  else
    HL2=0
  fi
  # Figure out if the hour is between 10 and 19 HL1
  if [ $HOUR -ge 10 -a $HOUR -le 19 ]
  then
    HL1=1
  else
    HL1=0
  fi

  HOUR1=`expr $HOUR % 10`
  # Figure out if HR8 should be on.
  if [ $HOUR1 -ge 8 ]
  then
    HR8=1
  else
    HR8=0
  fi
  # Figure out if HR4 should be on.
  if [ $HOUR1 -ge 4 -a $HOUR1 -le 7 ]
  then
    HR4=1
  else
    HR4=0
  fi
  # Figure out if HR2 should be on.
  if [ \( $HOUR1 -ge 2 -a $HOUR1 -le 3 \) -o \( $HOUR1 -ge 6 -a $HOUR1 -le 7 \) ]
  then
    HR2=1
  else
    HR2=0
  fi
  # Figure out if HR1 should be on.
  if [ `expr $HOUR1 % 2` -eq 1 ]
  then
    HR1=1
  else
    HR1=0
  fi
  # Figure out if ML4 should be on.
  if [ $MIN -ge 40 ]
  then
    ML4=1
  else
    ML4=0
  fi
  # Figure out if ML2 should be on.
  if [ $MIN -ge 20 -a $MIN -le 39 ]
  then
    ML2=1
  else
    ML2=0
  fi
  # Figure out if ML1 should be on.
  MIN10=`expr $MIN / 10`
  if [ `expr $MIN10 % 2` -eq 1 ]
  then
    ML1=1
  else
    ML1=0
  fi
  MIN1=`expr $MIN % 10`
  # Figure out if MR8 should be on.
  if [ $MIN1 -ge 8 ]
  then
    MR8=1
  else
    MR8=0
  fi
  # Figure out if MR4 should be on.
  if [ $MIN1 -ge 4 -a $MIN1 -le 7 ]
  then
    MR4=1
  else
    MR4=0
  fi
  # Figure out if MR2 should be on.
  if [ \( $MIN1 -ge 2 -a $MIN1 -le 3 \) -o \( $MIN1 -ge 6 -a $MIN1 -le 7 \) ]
  then
    MR2=1
  else
    MR2=0
  fi
  # Figure out if MR1 should be on.
  if [ `expr $MIN1 % 2` -eq 1 ]
  then
    MR1=1
  else
    MR1=0
  fi
  SEC10=`expr $SEC / 10`
  # Figure out if SL4 should be on.
  if [ $SEC10 -ge 4 ]
  then
    SL4=1
  else
    SL4=0
  fi
  # Figure out if SL2 should be on.
  if [ $SEC10 -ge 2 -a $SEC10 -le 3 ]
  then
    SL2=1
  else
    SL2=0
  fi
  # Figure out if SL1 should be on.
  if [ `expr $SEC10 % 2` -eq 1 ]
  then
    SL1=1
  else
    SL1=0
  fi
  SEC1=`expr $SEC % 10`
  # Figure out if SR8 should be on.
  if [ $SEC1 -ge 8 ]
  then
    SR8=1
  else
    SR8=0
  fi
  # Figure out if SR4 should be on.
  if [ $SEC1 -ge 4 -a $SEC1 -le 7 ]
  then
    SR4=1
  else
    SR4=0
  fi
  # Figure out if SR2 should be on.
  if [ \( $SEC1 -ge 2 -a $SEC1 -le 3 \) -o \( $SEC1 -ge 6 -a $SEC1 -le 7 \) ]
  then
    SR2=1
  else
    SR2=0
  fi
  # Figure out if SR1 should be on.
  if [ `expr $SEC1 % 2` -eq 1 ]
  then
    SR1=1
  else
    SR1=0
  fi
  clear
  echo
  echo " The time is $HOUR:$MIN:$SEC"
  echo
  echo -e "    $HR8   $MR8   $SR8"
  echo -e "    $HR4 $ML4 $MR4 $SL4 $SR4"
  echo -e "  $HL2 $HR2 $ML2 $MR2 $SL2 $SR2"
  echo -e "  $HL1 $HR1 $ML1 $MR1 $SL1 $SR1"
  echo
  sleep 1
done
