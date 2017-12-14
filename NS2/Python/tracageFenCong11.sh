gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-11-0.trace" using 1:2 with lines title 'Congestion window flux-11-0 ',\
			"congestion/congestion_window-11-1.trace" using 1:2 with lines title 'Congestion window flux-11-1',\
			"congestion/congestion_window-11-2.trace" using 1:2 with lines title 'Congestion window flux-11-2',\
			"congestion/congestion_window-11-3.trace" using 1:2 with lines title 'Congestion window flux-11-3',\
			"congestion/congestion_window-11-4.trace" using 1:2 with lines title 'Congestion window flux-11-4',\
			"congestion/congestion_window-11-5.trace" using 1:2 with lines title 'Congestion window flux-11-5',\
			"congestion/congestion_window-11-6.trace" using 1:2 with lines title 'Congestion window flux-11-6',\
			"congestion/congestion_window-11-12.trace" using 1:2 with lines title 'Congestion window flux-11-12',\
			"congestion/congestion_window-11-13.trace" using 1:2 with lines title 'Congestion window flux-11-13',\
			"congestion/congestion_window-11-14.trace" using 1:2 with lines title 'Congestion window flux-11-14',\
			"congestion/congestion_window-11-16.trace" using 1:2 with lines title 'Congestion window flux-11-16',\
			"congestion/congestion_window-11-17.trace" using 1:2 with lines title 'Congestion window flux-11-17',\
			"congestion/congestion_window-11-18.trace" using 1:2 with lines title 'Congestion window flux-11-18',\
			"congestion/congestion_window-11-19.trace" using 1:2 with lines title 'Congestion window flux-11-19',\
			"congestion/congestion_window-11-20.trace" using 1:2 with lines title 'Congestion window flux-11-20',\
			"congestion/congestion_window-11-21.trace" using 1:2 with lines title 'Congestion window flux-11-21',\
			"congestion/congestion_window-11-22.trace" using 1:2 with lines title 'Congestion window flux-11-22',\
			"congestion/congestion_window-11-24.trace" using 1:2 with lines title 'Congestion window flux-11-24'
EOF