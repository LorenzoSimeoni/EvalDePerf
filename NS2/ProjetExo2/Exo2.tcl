# Création d'un simulateur 
set ns [new Simulator]

# Création du fichier de trace utilisé par le visualisateur 
set nf [open out.nam w] 
#Création du fichier valeur où on va faire trace-all
set f [open valeur.tr w]

#Créations des 6 fichiers où on va mettre les informations concernants les flux
for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j<3} {incr j} {
		set (congestion_window-$i-$j) [open congestion/congestion_window-$i-$j.trace w]
	}
}


#permet d'obtennir les valeurs pour les utiliser ensuite avec un bash
#$ns trace-all $f
#$ns namtrace-all $nf 

$ns rtproto DV

#fonction récursive permettant de remplir les fichiers de congestion_window
proc plotWindow {tcpSource fichier} {
	global ns
	set time 0.1
	set now [$ns now]
	set cwnd [$tcpSource set cwnd_]
	puts $fichier "$now\t$cwnd"
	$ns at [expr $now+$time] "plotWindow $tcpSource $fichier"
}

proc finish {} { 
	# Force l'écriture dans le fichier des infos de trace 
	global ns nf f

	#$ns flush-trace 
	close $nf 
	close $f
	# Lance l'outil de visualisation nam 
	#exec nam out.nam & 

	#appel d'un bash pour tracer 3 graphes directement à la fin de l'éxecution
	exec ./tracagegraphe.sh &
	exec ./tracagegraphe2.sh &
	exec ./tracagegraphe3.sh &
	# Quitte le script TCL 
	exit 0 
}

#Création des noeuds source
set (n0) [$ns node] 
set (n1) [$ns node] 

#Création des grappes, avec 1 flux TCP par routeur vers celui en face dans l'autre grappe
for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j<3} {incr j} {
		set (n-$i-$j) [$ns node]
		for {set k 0} {$k < 2} {incr k} {
			for {set l 0} {$l < 3} {incr l} {
				if {$i != $k} {
					if {$j == $l} {
						set (tcp-$i-$j-$k-$l) [new Agent/TCP/Newreno]
						$(tcp-$i-$j-$k-$l) set window_ 8000
						$(tcp-$i-$j-$k-$l) set packetSize_ 1500
						puts (tcp-$i-$j-$k-$l)

						$ns attach-agent $(n-$i-$j) $(tcp-$i-$j-$k-$l)


						set (tcpsnk-$i-$j-$k-$l) [new Agent/TCPSink]
						$ns attach-agent $(n-$i-$j) $(tcpsnk-$i-$j-$k-$l)
					}
				}
			}
		}
		$ns duplex-link $(n$i) $(n-$i-$j) 1Mb 10ms DropTail
		$ns duplex-link-op $(n$i) $(n-$i-$j) queuePos 0.5
	}
}
$ns duplex-link $(n0) $(n1) 5Mb 10ms DropTail
$ns queue-limit $(n0) $(n1) 50


#Je redéfini un tcp, pour pouvoir changer le protocole utilisé, et ainsi comparer l'équité entre protocoles.
set (tcp-0-1-1-1) [new Agent/TCP/Newreno]
$(tcp-0-1-1-1) set window_ 8000
$(tcp-0-1-1-1) set packetSize_ 1500
$ns attach-agent $(n-0-1) $(tcp-0-1-1-1)


#Rempli le fichier utile pour avoir accès aux files d'attentes
set qfile [$ns monitor-queue $(n0) $(n1)  [open queue/queue.tr w] 0.05]
  [$ns link $(n0) $(n1)] queue-sample-timeout;

#Lance la fonction récursive et le flux TCP
for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j < 3} {incr j} {
		for {set k 0} {$k < 2} {incr k} {
			for {set l 0} {$l < 3} {incr l} {
				if {$i!=$k} {
					if {$j == $l} {
						$ns connect $(tcp-$i-$j-$k-$l) $(tcpsnk-$k-$l-$i-$j)
						$ns at 10 "plotWindow $(tcp-$i-$j-$k-$l) $(congestion_window-$i-$j)"	
						$ns at 1 "$(tcp-$i-$j-$k-$l) send 25000000"
					}
				}
			}
		}
	}
}



#Fin du programme après 100 sec
$ns at 100.0 "finish" 

# Démarrage du moteur de simulation 
$ns run 