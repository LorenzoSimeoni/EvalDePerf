# Création d'un simulateur 
set ns [new Simulator]

# Création du fichier de trace utilisé par le visualisateur 
set nf [open out.nam w] 


#permet d'obtennir les valeurs pour les utiliser ensuite avec un bash
$ns namtrace-all $nf 

$ns rtproto DV

proc finish {} { 
	# Force l'écriture dans le fichier des infos de trace 
	global ns nf

	$ns flush-trace 
	close $nf 
	# Lance l'outil de visualisation nam 
	exec nam out.nam & 

	# Quitte le script TCL 
	exit 0 
}

set (n0) [$ns node] 
set (n1) [$ns node] 

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
$ns duplex-link $(n-0-0) $(n-1-1) 1Mb 10ms DropTail
$ns duplex-link $(n-0-1) $(n-1-2) 1Mb 10ms DropTail
$ns duplex-link $(n-0-2) $(n-1-0) 1Mb 10ms DropTail
$ns duplex-link $(n0) $(n1) 5Mb 10ms DropTail
$ns queue-limit $(n0) $(n1) 50


#Je redéfini un tcp, pour pouvoir changer le protocole utilisé, et ainsi comparer l'équité entre protocoles.
set (tcp-0-1-1-1) [new Agent/TCP/Linux]
$(tcp-0-1-1-1) set window_ 8000
$(tcp-0-1-1-1) set packetSize_ 1500
$ns attach-agent $(n-0-1) $(tcp-0-1-1-1)


for {set i 0} {$i < 2} {incr i} {
	for {set j 0} {$j < 3} {incr j} {
		for {set k 0} {$k < 2} {incr k} {
			for {set l 0} {$l < 3} {incr l} {
				if {$i!=$k} {
					if {$j == $l} {
						$ns connect $(tcp-$i-$j-$k-$l) $(tcpsnk-$k-$l-$i-$j)
						$ns at 1 "$(tcp-$i-$j-$k-$l) send 25000000"
					}
				}
			}
		}
	}
}

$ns rtmodel-at 10.0 down $(n1) $(n0)
$ns rtmodel-at 20.0 up $(n1) $(n0)


$ns at 50.0 "finish" 

# Démarrage du moteur de simulation 
$ns run 