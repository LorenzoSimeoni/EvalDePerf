gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"
	
		plot "congestion/congestion_window-15-0.trace" using 1:2 with lines title 'Congestion window flux-15-0 ',\
			"congestion/congestion_window-15-1.trace" using 1:2 with lines title 'Congestion window flux-15-1',\
			"congestion/congestion_window-15-2.trace" using 1:2 with lines title 'Congestion window flux-15-2',\
			"congestion/congestion_window-15-3.trace" using 1:2 with lines title 'Congestion window flux-15-3',\
			"congestion/congestion_window-15-4.trace" using 1:2 with lines title 'Congestion window flux-15-4',\
			"congestion/congestion_window-15-5.trace" using 1:2 with lines title 'Congestion window flux-15-5',\
			"congestion/congestion_window-15-6.trace" using 1:2 with lines title 'Congestion window flux-15-6',\
			"congestion/congestion_window-15-12.trace" using 1:2 with lines title 'Congestion window flux-15-12',\
			"congestion/congestion_window-15-13.trace" using 1:2 with lines title 'Congestion window flux-15-13',\
			"congestion/congestion_window-15-14.trace" using 1:2 with lines title 'Congestion window flux-15-14',\
			"congestion/congestion_window-15-16.trace" using 1:2 with lines title 'Congestion window flux-15-16',\
			"congestion/congestion_window-15-17.trace" using 1:2 with lines title 'Congestion window flux-15-17',\
			"congestion/congestion_window-15-18.trace" using 1:2 with lines title 'Congestion window flux-15-18',\
			"congestion/congestion_window-15-19.trace" using 1:2 with lines title 'Congestion window flux-15-19',\
			"congestion/congestion_window-15-20.trace" using 1:2 with lines title 'Congestion window flux-15-20',\
			"congestion/congestion_window-15-21.trace" using 1:2 with lines title 'Congestion window flux-15-21',\
			"congestion/congestion_window-15-22.trace" using 1:2 with lines title 'Congestion window flux-15-22',\
			"congestion/congestion_window-15-24.trace" using 1:2 with lines title 'Congestion window flux-15-24'
EOF