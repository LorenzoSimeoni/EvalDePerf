# Création d'un simulateur 
set ns [new Simulator]

# Création du fichier de trace utilisé par le visualisateur 
set nf [open out.nam w] 

# Indique à NS de logguer ses traces dans le fichier $nf (out.nam) 
$ns namtrace-all $nf 

# Lorsque la simulation sera terminée, cette procédure sera appelée 
# pour lancer automatiquement le visualisateur (NAM) 
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

# création de trois noeuds source
set (n0) [$ns node] 
set (n1) [$ns node] 
set (n2) [$ns node] 


#Création des 3 grappes de 30 noeuds avec à chaque routeurs, 60 flux UDP pour envoyer en broadcast sur les autres grappes
for {set i 0} {$i < 3} {incr i} {
	for {set j 0} {$j < 30} {incr j} {
		set (n-$i-$j) [$ns node]
		for {set k 0} {$k < 3} {incr k} {
			for {set l 0} {$l < 30} {incr l} {
				#cette condition permet de ne pas avoir de routeurs envoyant sur les routeurs de la même "grappe"
				if {$i != $k} {
					set (udp-$i-$j-$k-$l) [new Agent/UDP]
					$ns attach-agent $(n-$i-$j) $(udp-$i-$j-$k-$l)
		
					set (cbr-$i-$j-$k-$l) [new Application/Traffic/CBR]
					$(cbr-$i-$j-$k-$l) set packetSize_ 1000 
					$(cbr-$i-$j-$k-$l) set rate_ 1mb
					$(cbr-$i-$j-$k-$l) attach-agent $(udp-$i-$j-$k-$l)

					set (null-$i-$j-$k-$l) [new Agent/Null] 
					$ns attach-agent $(n-$i-$j) $(null-$i-$j-$k-$l)
				}
			}
		}
		$ns duplex-link $(n$i) $(n-$i-$j) 50Mb 100ms SFQ 
		$ns duplex-link-op $(n$i) $(n-$i-$j) queuePos 0.5
	}

}
#Création des liens entre les routeurs source
$ns duplex-link $(n0) $(n1) 50Mb 100ms SFQ
$ns duplex-link $(n1) $(n2) 50Mb 100ms SFQ
$ns duplex-link $(n2) $(n0) 50Mb 100ms SFQ



#pour colorier ses échanges
#$ns color 1 Blue
#$ns color 2 Red
#$ns color 3 Green


for {set i 0} {$i < 3} {incr i} {
	for {set j 0} {$j < 30} {incr j} {
		for {set k 0} {$k < 3} {incr k} {
			for {set l 0} {$l < 30} {incr l} {
				if {$i!=$k} {
					$ns connect $(udp-$i-$j-$k-$l) $(null-$k-$l-$i-$j)

					#On lance les flux UDP
					$ns at 0.05 "$(cbr-$i-$j-$k-$l) start"
					$ns at 4.5 "$(cbr-$i-$j-$k-$l) stop"
				}
			}
		}
	}
}


# La simulation s'arrête après 5 secondes, et appelle la procédure 
# TCL nommée "finish" définie précédemment 
$ns at 5.0 "finish" 
# Démarrage du moteur de simulation 
$ns run 