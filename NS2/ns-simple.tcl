#Create a simulator object
set ns [new Simulator]

set nf [open out.nam w] 
$ns namtrace-all $nf 
#Define different colors for data flows (for NAM)
$ns color 1 Blue
$ns color 2 Red

#Open the NAM trace file
set f0 [open out0.tr w]
set f1 [open out1.tr w]

#Define a 'finish' procedure
proc finish {} { 
	# Force l'écriture dans le fichier des infos de trace 
	global f0 f1 ns nf

	$ns flush-trace 
	close $nf 
	# Lance l'outil de visualisation nam 
	exec nam out.nam & 

	close $f0
	close $f1
	# Quitte le script TCL 
	exec xgraph out0.tr out1.tr -geometry 800x400 &
        exit 0
}

proc record2 {} {
	global sink1 sink2 f0 f1
	set ns [Simulator instance]
	set time 0.5
	set bw1 [$sink1 set bytes_]
	set bw2 [$sink2 set bytes_]
	set now [$ns now]
    puts $f0 "$now [expr $bw1/$time*8/1000000]"
    puts $f1 "$now [expr $bw2/$time*8/1000000]"
    $sink1 set bytes_ 0
    $sink2 set bytes_ 0

    $ns at [expr $now+$time] "record2"
}
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
#Create four nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
$ns attach-agent $n3 $sink1
$ns attach-agent $n3 $sink2

#Create links between the nodes
$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 1.7Mb 20ms DropTail

#Set Queue Size of link (n2-n3) to 10
$ns queue-limit $n2 $n3 10

#Give node position (for NAM)
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

#Monitor the queue for link (n2-n3). (for NAM)
$ns duplex-link-op $n2 $n3 queuePos 0.5


#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n0 $udp1
$udp1 set fid_ 2
#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n1 $udp2
$udp2 set fid_ 1

#Setup a CBR over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set type_ CBR
$cbr1 set packet_size_ 1000
$cbr1 set rate_ 1mb
$cbr1 set random_ false
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set type_ CBR
$cbr2 set packet_size_ 1000
$cbr2 set rate_ 1mb
$cbr2 set random_ false

$ns connect $udp1 $sink1
$ns connect $udp2 $sink2


#Schedule events for the CBR and FTP agents
$ns at 0.0 "record2"
$ns at 1.0 "$cbr1 start"
$ns at 1.0 "$cbr2 start"
$ns at 4.0 "$cbr2 stop"
$ns at 4.0 "$cbr1 stop"


#Call the finish procedure after 5 seconds of simulation time
$ns at 5.0 "finish"

#Print CBR packet size and interval
puts "CBR packet size = [$cbr1 set packet_size_]"
puts "CBR interval = [$cbr1 set interval_]"
puts "CBR packet size = [$cbr2 set packet_size_]"
puts "CBR interval = [$cbr2 set interval_]"

#Run the simulation
$ns run

