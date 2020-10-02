#!/bin/bash
while : #This always returns true (see /bin/true and :)
do
echo -e 'Inventory Program Menu:
==========================
A)dd inventory item to database
R)emove inventory item from database
S)how inventory item from database
D)isplay all inventory items in the database
Q)uit
Enter your selection ==> \c'
read ANS
case "$ANS" in
   a | A ) echo -e "What is the name of the item? --> \c"
           read ITEM
           echo -e "What is the item cost? --> \c"
           read COST
           echo -e "What is the selling price of the item? --> \c"
           read PRICE
           echo -e "How much of this item is in inventory? --> \c"
           read INV
           echo -e "$ITEM\t$COST\t$PRICE\t$INV" >> ~/hardware.database
           sort ~/hardware.database > /tmp/$$.tmp
           rm ~/hardware.database
           mv /tmp/$$.tmp ~/hardware.database
           ;;
   r | R ) echo -e "What entry would you like to remove? --> \c"
           read DELANS
           grep -v "$DELANS" ~/hardware.database > /tmp/$$.tmp
           rm ~/hardware.database
           mv /tmp/$$.tmp ~/hardware.database
           ;;
   s | S ) echo -e "What would you like to search for? --> \c"
           read SHOWANS
           grep -i $SHOWANS ~/hardware.database
           ;;
   d | D ) less ~/hardware.database
           ;;
   q | Q ) exit 0
           ;;
       * ) echo "You have entered an invalid response."
           sleep 2
           ;;
esac
done
