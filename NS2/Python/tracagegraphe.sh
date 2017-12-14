gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel "File d'attentes (paquets)"
	plot "queue/queue-0-1.tr" using 1:5 with lines title 'Taille de la queue entre 2 noeuds'

EOF