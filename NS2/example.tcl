# Création d'un simulateur 
set ns [new Simulator]

# Création du fichier de trace utilisé par le visualisateur  
set f0 [open out0.tr w]
set f1 [open out1.tr w]
set f2 [open out2.tr w]


# Lorsque la simulation sera terminée, cette procédure sera appelée 
# pour lancer automatiquement le visualisateur (NAM) 
proc finish {} { 
	# Force l'écriture dans le fichier des infos de trace 
	global f0 f1 f2

	close $f0
	close $f1
	close $f2 
	# Quitte le script TCL 
	exec xgraph out0.tr out1.tr out2.tr -geometry 800x400 &
        exit 0
}

set n0 [$ns node] 

# Création d'une liaison de communication full duplex entre les noeuds n0 & n1 
# Fonctionne à 1Mbps, 10ms de délai, et utilise l'algorithme de file DropTail 


# création d'un agent UDP implanté dans n0 

for {set i 0} {$i < 9} {incr i} {
	set (n$i) [$ns node]
	
	for {set k 0} {$k < 9} {incr k} {
		if {$i != $k} {
			set (udp-$i-$k) [new Agent/UDP]
			$ns attach-agent $(n$i) $(udp-$i-$k)

			set (cbr-$i-$k) [new Application/Traffic/CBR]
			$(cbr-$i-$k) set packetSize_ 500 
			$(cbr-$i-$k) set interval_ 0.005 
			$(cbr-$i-$k) attach-agent $(udp-$i-$k)
		}
	set null($i) [new Agent/Null] 
	$ns attach-agent $(n$i) $null($i)
	}
	$ns duplex-link $n0 $(n$i) 1Mb 100ms DropTail 
	$ns duplex-link-op $n0 $(n$i) queuePos 0.5
}

$(udp-2-1) set class_ 1
$(udp-1-2) set class_ 2
$ns color 1 Blue
$ns color 2 Red
for {set i 0} {$i < 9} {incr i} {
	for {set k 0} {$k < 9} {incr k} {
		if {$i != $k} {
			$ns connect $(udp-$i-$k) $null([expr ($i+1)%9])
			$ns at 0.05 "$(cbr-$i-$k) start"
			$ns at 4.5 "$(cbr-$i-$k) stop"
		}
	}
}


# La simulation s'arrête après 5 secondes, et appelle la procédure 
# TCL nommée "finish" définie précédemment 
$ns at 5.0 "finish" 
# Démarrage du moteur de simulation 
$ns run 


#1ere etude
#tcp equitable, vérifier. Equitable dans la mesure du RTT
#Pour tester on peut changer les durées de propagations sur les liens
#On augmente 1 seul lien et on met les différentes mesures le flux sur les liens (mesurer le debit utile)
#pourquoi quand le RTT augmente TCP s'en sort moins bien? quand le rtt est long le temps de reaction est
#augmenté, donc il va lui falloir plus de temps pour voir qu'il y a un problème.


#Ne pas faire de trop grosses files
#2eme etude
#taille des files d'attentes jusqu'a ce que TCP se comporte mal

#3 eme etude, comment marche les flux tcp entre eux