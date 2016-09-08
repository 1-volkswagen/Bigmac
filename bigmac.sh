#!/bin/bash
echo Big Mac value for XVC.
echo ""
echo NOTE: The Big Mac conversion rate equals 0.2 taken from the economist BMI chart.
echo NOTE: The XVC USD value is downloaded from coinmarketcap.com.
echo ""

#Make the user aware of the data sources.

read -rsp $"Press any key to continue." -n 1
echo ""
echo ""

#Make the Big Mac value directory

mkdir -p data

#Change to the Big Mac value directory.

cd data

#Download the latest data to calculate the big mac value.

curl https://api.coinmarketcap.com/v1/ticker/vcash/ > ticker.csv
echo ""

#Format the data of the Big Mac value.

head -n+7 ticker.csv | tail -n+7 | cut -c 23-30 > ticker.price

#Create variable for price calculation.

bmcrate=0.2
ticker=$(cat ticker.price)

#Multiply variable with the conversion rate.

bigmacs=$(echo "$bmcrate * $ticker" | bc)

#Ask user amount of XVC wished calculated.

read -p $"Enter the amount of XVC: " xvc

#Multiply with Big Macs per XVC.

echo "$xvc * $bigmacs" | bc > total.price
total=$(cat total.price)
echo ""
echo Your cryptographic captital buys you $total Big Macs in the United States of America.
