gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel "Fenêtre de congestion (paquets)"
	plot "congestion/congestion_window-0-0.trace" using 1:2 with lines title 'Congestion window flux 1',\
		"congestion/congestion_window-0-1.trace" using 1:2 with lines title 'Congestion window flux 2',\
		"congestion/congestion_window-0-2.trace" using 1:2 with lines title 'Congestion window flux 3'
EOF