#!/usr/bin/python3.4
# -*-coding:Utf-8 -*

import scipy.special as sps
import numpy as np
import math
import random as rand

pertesTab=[]
VolumeArriveTab=[]
VolumeDepartTab=[]
origine = []
destination = []

pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-1.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(1)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-3.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(3)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-4.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(4)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-2.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(2)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-17.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(17)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-0-19.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(0)
		dest = int(19)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-1-6.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(1)
		dest = int(6)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-1-21.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(1)
		dest = int(21)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-1-16.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(1)
		dest = int(16)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-2-18.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(2)
		dest = int(18)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-2-10.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(2)
		dest = int(10)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-2-16.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(2)
		dest = int(16)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-3-5.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(3)
		dest = int(5)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-3-21.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(3)
		dest = int(21)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-4-5.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(4)
		dest = int(5)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-4-15.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(4)
		dest = int(15)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-5-20.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(5)
		dest = int(20)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-5-22.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(5)
		dest = int(22)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-6-9.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(6)
		dest = int(9)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-9-10.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(9)
		dest = int(10)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-10-11.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(10)
		dest = int(11)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-11-12.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(11)
		dest = int(12)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-12-15.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(12)
		dest = int(15)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-12-13.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(12)
		dest = int(13)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-13-14.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(13)
		dest = int(14)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-14-15.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(14)
		dest = int(15)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-17-19.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(17)
		dest = int(19)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-17-18.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(17)
		dest = int(18)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-18-22.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(18)
		dest = int(22)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-1-24.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(1)
		dest = int(24)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-15-24.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(15)
		dest = int(24)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-25-6.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(25)
		dest = int(6)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-25-5.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(25)
		dest = int(5)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-25-15.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(25)
		dest = int(15)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()
pertes=0
arr = 0
dep = 0
stats = open("queue/queue-25-20.tr","r") 
for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes+int(data[7])
		orig = int(25)
		dest = int(20)
		arr = arr + int(data[5])
		dep = dep + int(data[6])
print "orig,dest: "+str(orig)+str(dest)+" \n " 
pertesTab.append(pertes)
origine.append(orig)
destination.append(dest)
VolumeArriveTab.append(arr)
VolumeDepartTab.append(dep)
stats.close()



num = 0
for k in range(1,len(pertesTab)):
	if pertesTab[k]>pertesTab[num]:
		num = k
print pertesTab[num]

max1 = []
max1.append(pertesTab[num])
max1.append(origine[num])
max1.append(destination[num])
max1.append(VolumeArriveTab[num])
max1.append(VolumeDepartTab[num])

print "Le pire lien est entre les noeuds "+str(max1[1])+" et "+str(max1[2])+".\n On voit qu'il y a "+str(max1[0])+" pertes pour un volume d'arrivée dans ce lien de "+str(max1[3])+".\n"

pertesTab.remove(max1[0])
origine.remove(max1[1])
destination.remove(max1[2])
VolumeDepartTab.remove(max1[4])
VolumeArriveTab.remove(max1[3])
num = 0
for k in range(1,len(pertesTab)):
	if pertesTab[k]>pertesTab[num]:
		num = k
print pertesTab[num]

max2 = []
max2.append(pertesTab[num])
max2.append(origine[num])
max2.append(destination[num])
max2.append(VolumeArriveTab[num])
max2.append(VolumeDepartTab[num])

print "Le deuxieme pire lien est entre les noeuds "+str(max2[1])+" et "+str(max2[2])+".\n On voit qu'il y a "+str(max2[0])+" pertes pour un volume d'arrivée dans ce lien de "+str(max2[3])+".\n"

pertesTab.remove(max2[0])
origine.remove(max2[1])
destination.remove(max2[2])
VolumeDepartTab.remove(max2[4])
VolumeArriveTab.remove(max2[3])
num = 0
for k in range(1,len(pertesTab)):
	if pertesTab[k]>pertesTab[num]:
		num = k
print pertesTab[num]

max3 = []
max3.append(pertesTab[num])
max3.append(origine[num])
max3.append(destination[num])
max3.append(VolumeArriveTab[num])
max3.append(VolumeDepartTab[num])


print "Le troisième pire lien est entre les noeuds "+str(max3[1])+" et "+str(max3[2])+".\n On voit qu'il y a "+str(max3[0])+" pertes pour un volume d'arrivée dans ce lien de "+str(max3[3])+".\n"

stats = open("queue/queue-"+str(0)+"-"+str(1)+".tr","r")




pertes = 0
VolumeArriveB = 0
VolumeDepartB = 0

for ligne in stats:
	data = ligne.rstrip('\n\r').split(" ")
	if len(data)>=11:
		pertes = pertes + int(data[7])
		VolumeArriveB = VolumeArriveB + int(data[5])
		VolumeDepartB = VolumeDepartB + int(data[6])



# print pertes
# print VolumeArriveB
# print VolumeDepartB

stats.close()

