# ####################################################################
# Create bottleneck and dest nodes
set ns [new Simulator]

  set n2 [$ns node]
  set n3 [$ns node]

# ####################################################################
# Create bottleneck link (between bottleneck nodes n2-n3)
  $ns duplex-link $n2 $n3 0.7Mb 20ms DropTail

# ####################################################################
# Set Queue Size of bottleneck link (n2-n3)
  $ns queue-limit $n2 $n3 100

# ####################################################################
# Set number of sources
  set NumbSrc 3

# ####################################################################
# Use a for-loop to create $NumbSrc source nodes
  for {set j 1} {$j<=$NumbSrc} { incr j } {
     set S($j) [$ns node]
  }

# ####################################################################
# This part is used to start the sources at random times
# ####################################################################
# Create a random generator for starting the ftp and
# for bottleneck link delays
  set rng [new RNG]
  $rng seed 2

# ####################################################################
# parameters for random variables for begenning of ftp connections
  set RVstart [new RandomVariable/Uniform]
  $RVstart set min_ 0
  $RVstart set max_ 7
  $RVstart use-rng $rng

# ####################################################################
# Define RANDOM starting times for each connection
# And set (possible random) delay for connection from sources to Node 0
  for {set i 1} {$i<=$NumbSrc} { incr i } {
     set startT($i)  [expr [$RVstart value]]
     set dly($i) 1

     puts "startT($i)  $startT($i) sec"
     puts $param "startT($i)  $startT($i) sec"
  }

# ####################################################################
# Create links between source and bottleneck
#  1. Select the delay from each source to bottleneck node
#  2. Set queue size (#packets)
  for {set j 1} {$j<=$NumbSrc} { incr j } {
     $ns duplex-link $S($j) $n2 10Mb $dly($j)ms DropTail
     $ns queue-limit $S($j) $n2 20
  }

# ####################################################################
# Orient the links
  $ns duplex-link-op $n2 $n3 orient right
  $ns duplex-link-op $S(1) $n2 orient right-down
  $ns duplex-link-op $S(2) $n2 orient right
  $ns duplex-link-op $S(3) $n2 orient right-up

# ####################################################################
# Create TCP Sources
  for {set j 1} {$j<=$NumbSrc} { incr j } {
     set tcp_src($j) [new Agent/TCP/Reno]
     $tcp_src($j) set window_ 8000
  }

# ####################################################################
# Color the packets
  $tcp_src(1) set fid_ 1
  $ns color 1 red
  $tcp_src(2) set fid_ 2
  $ns color 2 yellow
  $tcp_src(3) set fid_ 3
  $ns color 3 blue

# ####################################################################
# Create TCP Destinations
  for {set j 1} {$j<=$NumbSrc} { incr j } {
     set tcp_snk($j) [new Agent/TCPSink]
  }

# ####################################################################
# Schedule START events for the FTP agents:
  for {set i 1} {$i<=$NumbSrc} { incr i } {
     $ns at $startT($i) "$ftp($i) start"
     $ns at $SimDuration "$ftp($i) stop"
  }
 
 $ns run
