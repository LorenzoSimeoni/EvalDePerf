gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel "Fenêtre de congestion (paquets)"

	plot"congestion/congestion_window-1-0.trace" using 1:2 with lines title 'Congestion window flux 4',\
		"congestion/congestion_window-1-1.trace" using 1:2 with lines title 'Congestion window flux 5',\
		"congestion/congestion_window-1-2.trace" using 1:2 with lines title 'Congestion window flux 6',\

EOF