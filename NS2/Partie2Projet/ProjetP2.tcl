# instants de départ des différents flux ->tirage aleatoire  (uniforme) entre [5,800 ]sec Reseau Géant
#On prends que la période stable ( entre 5 - 800) on ignore les 2 périodes suivantes :
# - 0 - 5  c'est la période de charge Warm Up
# -  800 - 900 c'est la période de décharge Warm Down) 
#Faire la figure puis couper 100 sec à gauche et à droite
#Dessiner la taille des flux TCP : Utiliser des lois de puissance, Pareto ou ZipF
#Peu de flux éléphants  ( 10%) mais qui represente 90% du trafic internet 
#bcp de flux souris ( 90 %) mais qui ne représente que 10 % du trafic internet
#Fichier traff.traf
#Source | Destination | Volume de trafic
#On prend la valeur du volume, et on reconstruit plein de flux; faire plein de tirage, jusqu'à ce que la somme soit supérieur à V(V-10%;V+10%)
#Si on veut limiter les flux on peut jouer sur le rayon de courbure, pour limiter la durée de simulation
#Il faut faire un Pareto borné: ne pas tirer des valeurs trop grandes (la moitié de V par exemple, attention, il faut justifier la valeur choisie :o)
#Dans toutes les courbes, il faut avoir les intervalles de confiance

#Pareto ou Zipf(cousin de Pareto en discret!!!!)
#ZipF  est identique à Pareto mais avec que les avantages !
#Pareto => valeur non entieres, mais flottantes (9.5 paquets ou 9.5 bits = chiant)
#Zipf => valeurs entières, bornes (sup, min..)

#topo.top 
#Extremité de départ | Extremite finale | Débit (Gb/s) | Delai de propagation (en ms)

#distance oxTHAUREdeaunique = courbure de la terre (pas une ligne droite)
#Division par 100 du débit et du volume pour simuler sans prendre 18h!!!!

#Modèle On/Off: simuler les flux TCP
#20% du trafic soit évacuer en TCP
#80% du trafic par On/Off: on envoie des données pendant ON et rien pendant OFF
#- espérance ON(100ms)
#- espérance OFF(100ms)
#- rate X
#- shape
