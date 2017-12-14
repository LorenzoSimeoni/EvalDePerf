#!/usr/bin/python3.4
# -*-coding:Utf-8 -*

import scipy.special as sps
import numpy as np
import math
import random as rand

def creationTopologie(topo, tcl):

	CreationNoeuds = []

	for ligne in topo:
		# permet de récupérer une ligne dans une liste, data
		data = ligne.rstrip('\n\r').split(" ")

		# on regarde si l'un des noeuds évoqués dans le tableau est déjà créé ou non pour ne pas
		# créer de doublons
		if data[0] not in CreationNoeuds:
			CreationNoeuds.append(data[0])
			tcl.write("set (n"+ data[0] +") [$ns node]\n")
			
		if data[1] not in CreationNoeuds:
			CreationNoeuds.append(data[1])
			tcl.write("set (n"+ data[1] +") [$ns node]\n")


		# on créé des liens en Gb, avec soit DropTail, soit RED pour gérer la queue. J'ai choisi au final DropTail car
		# on n'observe pas énormément de congestion, et donc les files d'attentes ne se remplissent pas souvent en entier
		tcl.write("$ns duplex-link $(n"+data[0]+") $(n"+data[1]+") "+data[2]+"Gb "+data[3]+"ms RED\n")
		# c'est ici qu'on gère la taille des files d'attentes dans les queues
		tcl.write("$ns queue-limit $(n"+data[0]+") $(n"+data[1]+") 20\n")
		# on lance monitor queue, qui permet d'avoir les informations utiles des queues, comme les pertes, le nombre de data qui arrive, 
		# et le nombre de data qui sort etc. On créé un fichier par liaisons présentes dans le fichier de topologie
		tcl.write("set queue-"+data[0]+"-"+data[1]+" [$ns monitor-queue $(n"+data[0]+") $(n"+data[1]+")  [open queue/queue-"+data[0]+"-"+data[1]+".tr w] 0.05]\n")
		
		#cette partie commenté m'a permis de générer ce qu'il y a dans staistiques.py, pour trouver quels liens avaient le plus de pertes
		# python = open("statistiques.py","a")
		# python.write("pertes=0\n")
		# python.write("arr = 0\n")
		# python.write("dep = 0\n")
		# python.write("stats = open(\"queue/queue-"+data[0]+"-"+data[1]+".tr\",\"r\") \n")
		# python.write("for ligne in stats:\n")
		# python.write("	data = ligne.rstrip(\'\\n\\r\').split(\" \")\n")
		# python.write("	if len(data)>=11:\n")
		# python.write("		pertes = pertes+int(data[7])\n")
		# python.write("		orig = int("+data[0]+")\n")
		# python.write("		dest = int("+data[1]+")\n")
		# python.write("		arr = arr + int(data[5])\n")
		# python.write("		dep = dep + int(data[6])\n")

		# python.write("print \"orig,dest: \"+orig+dest+\" \\n \" \n")
		# python.write("pertesTab.append(pertes)\n")
		# python.write("origine.append(orig)\n")
		# python.write("destination.append(dest)\n")
		# python.write("VolumeArriveTab.append(arr)\n")
		# python.write("VolumeDepartTab.append(dep)\n")

		# python.write("stats.close()\n")
		# python.close()

		# ici j'ai créé un unique fichier queue.tr pour connaitre la total des pertes, mais avec statistiques.py qui donne les 3 pires liens
		# j'ai trouvé ça obsolète
		# tcl.write("set queue-"+data[0]+"-"+data[1]+" [$ns monitor-queue $(n"+data[0]+") $(n"+data[1]+")  [open queue/queue.tr a] 0.05]\n")
		tcl.write("[$ns link $(n"+data[0]+") $(n"+data[1]+")] queue-sample-timeout;\n")

def GenerationTrafic(traf, tcl,graph):

	# On fixe les paramètres de la loi zipf
	# burst et idle permettent de déinir les périodes ON/OFF.
	# On à la 500ms d'envoi et 500ms d'attentes, ce qui est un délai assez long mais dans un LFN 
	# tel que Géant, on a un delai assez grand donc c'est cohérent
	burst = 500
	idle = 500
	# Une des variable les plus importante, le shape, ou rayon de courbure
	# Elle va permettre de controler le nombre de flux souris et éléphants
	# Un shape grand va créer beaucoup plus de très petits flux
	# Après quelques test, j'ai déterminé que la valeur qui semblait correspondre au 90%-10%
	# semblait être 1.2, j'ai donc choisi cette valeur par la suite
	shape = 1.1

	# plot = []
	for ligne in traf:
		data = ligne.rstrip('\n\r').split(" ")

		#permet de créer les fichiers dans lesquels il y aura les valeurs de congestions des flux TCP
		tcl.write("set (congestion_window-"+data[0]+"-"+data[1]+") [open congestion/congestion_window-"+data[0]+"-"+data[1]+".trace w]\n")
		
		# m'a permis de faire les fichier de plot pour les fenêtres de congestions
		# if data[0] not in plot:
		# 	plot.append(data[0])
		# 	graph.write("		plot \"congestion/congestion_window-"+data[0]+"-"+data[1]+".trace\" using 1:2 with lines title 'Congestion window flux-"+data[0]+"-"+data[1]+" ',\\\n")
		# else:
		# 	graph.write("			\"congestion/congestion_window-"+data[0]+"-"+data[1]+".trace\" using 1:2 with lines title 'Congestion window flux-"+data[0]+"-"+data[1]+"',\\\n")
			

		########On met en place le flux ON/OFF avec 80% de la data en Pareto#########
		tcl.write("set (udp-"+data[0]+"-"+data[1]+") [new Agent/UDP] \n")
		tcl.write("$ns attach-agent $(n"+ data[0] +") $(udp-"+data[0]+"-"+data[1]+") \n")

		tcl.write("set (sink-"+data[1]+"-"+data[0]+") [new Agent/UDP] \n")
		tcl.write("$ns attach-agent $(n"+data[1]+") $(sink-"+data[1]+"-"+data[0]+") \n")

		tcl.write("$ns connect $(udp-"+data[0]+"-"+data[1]+") $(sink-"+data[1]+"-"+data[0]+")\n")

		tcl.write("set (Pareto-"+data[0]+"-"+data[1]+") [new Application/Traffic/Pareto]\n")
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") set packetSize_ 1500\n")
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") set burst_time_ "+str(burst)+"ms\n")
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") set idle_time_ "+str(idle)+"ms\n")
		rate = int(data[2])*0.80 / 30 #Pour avoir le bon rate à chaque fois
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") set rate_ "+str(rate)+"\n")
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") set shape_ "+str(shape)+"\n")
		tcl.write("$(Pareto-"+data[0]+"-"+data[1]+") attach-agent $(udp-"+data[0]+"-"+data[1]+")\n")

		tcl.write("$ns at 0 \"$(Pareto-"+data[0]+"-"+data[1]+") start\" \n")
		tcl.write("$ns at 30.0 \"$(Pareto-"+data[0]+"-"+data[1]+") stop\" \n")

		########On met en place des flux TCP "normaux" avec 90% de souris et 10% d'éléphant########
		volumeData = int(data[2])*0.2*1000000000 # on multiplie par 1000000000 pour mettre en Go

		volumeDivise = 0.0

		# Permet de compter le nombre de flux qu'on a créé avec le volume de base
		# et donc de les créer de noms différents à chaque fois
		nbFluxDivise = 0
		# 
		while volumeDivise <= volumeData:
			
			# On subdivise le volumeData, en petitVolume, tirés grâce à une loie Zipf, parfaite pour
			# mettre en place le 90%/10%. Avec le shape à 1.2, car j'ai observé qu'il était bien pour le 90%/10%.
			# Si le volume est supèrieur au VolumeData, on refait le tirage
			petitVolume = np.random.zipf(shape)* 1000000000
			# tests avec une loi uniforme
			# petitVolume = rand.random() * volumeData
			while petitVolume > volumeData:
				petitVolume = np.random.zipf(shape)* 1000000000

			print volumeDivise
			print volumeData


			volumeDivise = volumeDivise + petitVolume

			# Ici on créé tous les flux TCP, de MTU 1500(valeur très généralement utilisée),
			# avec une fenêtre de 64, j'ai choisi Linux pour 
			# essayer de mieux gérer un LFN comme Géant, car Reno et Tahoe ne sont pas parfait pour utiliser la BP
			# Je n'ai pas vraiment remarqué des performances plus folles avec Linux, je me demande donc si par Linux
			# ils veulent dire CUBIC, ou autre chose.. Quoiqu'il en soit les résultats étaient quand même meilleurs
			tcl.write("set (tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") [new Agent/TCP/Newreno]\n")
			tcl.write("$(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") set window_ 64\n")
			tcl.write("$(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") set packetSize_ 1500\n")
			tcl.write("puts (tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+")\n")
			tcl.write("$ns attach-agent $(n"+ data[0] +") $(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+")\n")
			tcl.write("set (tcpsnk-"+data[1]+"-"+data[0]+"-"+str(nbFluxDivise)+") [new Agent/TCPSink]\n")
			tcl.write("$ns attach-agent $(n"+ data[1] +") $(tcpsnk-"+data[1]+"-"+data[0]+"-"+str(nbFluxDivise)+")\n")


			tcl.write("$ns connect $(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") $(tcpsnk-"+data[1]+"-"+data[0]+"-"+str(nbFluxDivise)+")\n")
			
			# On calcule un temps de départ, grâce à une loi uniforme, pour rendre le traffic plus réel
			# Avec une loi exponentielle on pourrait créer des burst etc.. mais le fait d'avoir des flux plus ou
			# moins gros créé déjà ces péroides de bursts, j'ai donc choisi la loi uniforme, qui correspondait celon moi
			# mieux à un traffic réel, (en 5 min, il y a à peu près autant de gens qui initialisent un flux au début qu'à la fin)
			time = rand.random() * (30 - 5) + 5
			
			tcl.write("$ns at "+str(time)+" \"$(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") send "+str(petitVolume)+"\"\n\n")
			#tcl.write("$ns at 0 \"$(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") send "+str(petitVolume)+"\"\n\n")

			#tcl.write("$ns at 10 \"plotWindow $(tcp-"+data[0]+"-"+data[1]+"-"+str(nbFluxDivise)+") $(congestion_window-"+data[0]+"-"+data[1]+")\" \n")
			nbFluxDivise = nbFluxDivise + 1
		# Fait un appel récursif à la fonction plotWindow, et créé les fichiers de congestion.
		# Je le fait pour un seul des petits flux générés, sinon on ne voit plus rien, déjà que...	
		tcl.write("$ns at 10 \"plotWindow $(tcp-"+data[0]+"-"+data[1]+"-"+str(0)+") $(congestion_window-"+data[0]+"-"+data[1]+")\" \n")



# on ouvre les différents fichiers dans lesquels on va, soit écrire, soit prendre des informations
topo = open("topo.top","r")
traf = open("traff.traf","r")
# La simulation en tcl, âttention, avec un shape trop grand peut dépasser les Go --> plus d'espace disque
tcl = open("Partie2Projet.tcl","w+")
# ce fichier m'a permis de créer une commande plot pour afficher les fenêtre de congestion, peu convaincant par rapport
# aux graphes de la partie d'avant
graph = open("tracageFenCong.sh","w+")


# Pour écrire le fichier .sh avec toutes les courbes de congestions
# graph.write("gnuplot -p << EOF\n\n")
# graph.write("	set xlabel \"Temps (s)\"\n")
# graph.write("	set ylabel\"Fenêtre de congestion (paquets)\"\n\n")

#debut d'écriture du fichier tcl
tcl.write("set ns [new Simulator]\n\n")

#fonction récursive permettant de remplir les fichiers de congestion_window
tcl.write("proc plotWindow {tcpSource fichier} {\n")
tcl.write("	global ns\n")
tcl.write("	set time 0.1\n")
tcl.write("	set now [$ns now]\n")
tcl.write("	set cwnd [$tcpSource set cwnd_]\n")
tcl.write("	puts $fichier \"$now\t$cwnd\"\n")
tcl.write("	$ns at [expr $now+$time] \"plotWindow $tcpSource $fichier\"\n")
tcl.write("	}\n")



# fonction appelée à la fin du programme
tcl.write("proc finish {} {\n")
tcl.write("	global ns \n")
tcl.write("	exec ./tracagegraphe.sh &")
tcl.write("	exit 0\n")
tcl.write("}\n\n")

# Première fonction python qui créée la topologie, on y gère le type de queue, la taille
# et on y fait appelle aux fonctions récursives
creationTopologie(topo,tcl)
tcl.write("\n\n\n")

# Fonction principale du projet, elle permet de regarder la taille des flux présents dans traff.traf
# puis de créer 80% de flux UDP, Pareto, et 20% de flux TCP, Linux souvent. 
# Les 20 % de flux TCP sont subdivisés en 90% de flux souris et 10% de flux éléphant grâce à une loie Zipf
GenerationTrafic(traf,tcl,graph)


tcl.write("$ns at 30.0 \"finish\"\n")
tcl.write("$ns run")


# graph.write("EOF")

graph.close()
topo.close()
tcl.close()
traf.close()



















