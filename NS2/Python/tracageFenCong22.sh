gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-22-0.trace" using 1:2 with lines title 'Congestion window flux-22-0 ',\
			"congestion/congestion_window-22-1.trace" using 1:2 with lines title 'Congestion window flux-22-1',\
			"congestion/congestion_window-22-2.trace" using 1:2 with lines title 'Congestion window flux-22-2',\
			"congestion/congestion_window-22-3.trace" using 1:2 with lines title 'Congestion window flux-22-3',\
			"congestion/congestion_window-22-4.trace" using 1:2 with lines title 'Congestion window flux-22-4',\
			"congestion/congestion_window-22-5.trace" using 1:2 with lines title 'Congestion window flux-22-5',\
			"congestion/congestion_window-22-6.trace" using 1:2 with lines title 'Congestion window flux-22-6',\
			"congestion/congestion_window-22-9.trace" using 1:2 with lines title 'Congestion window flux-22-9',\
			"congestion/congestion_window-22-12.trace" using 1:2 with lines title 'Congestion window flux-22-12',\
			"congestion/congestion_window-22-14.trace" using 1:2 with lines title 'Congestion window flux-22-14',\
			"congestion/congestion_window-22-15.trace" using 1:2 with lines title 'Congestion window flux-22-15',\
			"congestion/congestion_window-22-17.trace" using 1:2 with lines title 'Congestion window flux-22-17',\
			"congestion/congestion_window-22-18.trace" using 1:2 with lines title 'Congestion window flux-22-18',\
			"congestion/congestion_window-22-20.trace" using 1:2 with lines title 'Congestion window flux-22-20',\
			"congestion/congestion_window-22-21.trace" using 1:2 with lines title 'Congestion window flux-22-21',\
			"congestion/congestion_window-22-24.trace" using 1:2 with lines title 'Congestion window flux-22-24'
EOF