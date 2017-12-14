#!/bin/bash

FILENAME=$1

pertes = 0

while read Time origin destination sizeBits sizePacket arrivals departures drops arrB depB dropB
do
	
	let pertes = pertes + dropB

	echo  "$pertes"


done < $FILENAME