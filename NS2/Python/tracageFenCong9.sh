gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-9-0.trace" using 1:2 with lines title 'Congestion window flux-9-0 ',\
			"congestion/congestion_window-9-1.trace" using 1:2 with lines title 'Congestion window flux-9-1',\
			"congestion/congestion_window-9-2.trace" using 1:2 with lines title 'Congestion window flux-9-2',\
			"congestion/congestion_window-9-3.trace" using 1:2 with lines title 'Congestion window flux-9-3',\
			"congestion/congestion_window-9-4.trace" using 1:2 with lines title 'Congestion window flux-9-4',\
			"congestion/congestion_window-9-5.trace" using 1:2 with lines title 'Congestion window flux-9-5',\
			"congestion/congestion_window-9-6.trace" using 1:2 with lines title 'Congestion window flux-9-6',\
			"congestion/congestion_window-9-12.trace" using 1:2 with lines title 'Congestion window flux-9-12',\
			"congestion/congestion_window-9-13.trace" using 1:2 with lines title 'Congestion window flux-9-13',\
			"congestion/congestion_window-9-14.trace" using 1:2 with lines title 'Congestion window flux-9-14',\
			"congestion/congestion_window-9-15.trace" using 1:2 with lines title 'Congestion window flux-9-15',\
			"congestion/congestion_window-9-16.trace" using 1:2 with lines title 'Congestion window flux-9-16',\
			"congestion/congestion_window-9-17.trace" using 1:2 with lines title 'Congestion window flux-9-17',\
			"congestion/congestion_window-9-18.trace" using 1:2 with lines title 'Congestion window flux-9-18',\
			"congestion/congestion_window-9-19.trace" using 1:2 with lines title 'Congestion window flux-9-19',\
			"congestion/congestion_window-9-20.trace" using 1:2 with lines title 'Congestion window flux-9-20',\
			"congestion/congestion_window-9-21.trace" using 1:2 with lines title 'Congestion window flux-9-21',\
			"congestion/congestion_window-9-22.trace" using 1:2 with lines title 'Congestion window flux-9-22',\
			"congestion/congestion_window-9-24.trace" using 1:2 with lines title 'Congestion window flux-9-24'
EOF