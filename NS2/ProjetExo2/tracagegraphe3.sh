gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel "File d'attentes (paquets)"
	plot "queue/queue.tr" using 1:5 with lines title 'Taille de la queue entre les 2 noeuds principaux'

EOF