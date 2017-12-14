gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-1-0.trace" using 1:2 with lines title 'Congestion window flux-1-0 ',\
			"congestion/congestion_window-1-2.trace" using 1:2 with lines title 'Congestion window flux-1-2',\
			"congestion/congestion_window-1-3.trace" using 1:2 with lines title 'Congestion window flux-1-3',\
			"congestion/congestion_window-1-4.trace" using 1:2 with lines title 'Congestion window flux-1-4',\
			"congestion/congestion_window-1-5.trace" using 1:2 with lines title 'Congestion window flux-1-5',\
			"congestion/congestion_window-1-6.trace" using 1:2 with lines title 'Congestion window flux-1-6',\
			"congestion/congestion_window-1-9.trace" using 1:2 with lines title 'Congestion window flux-1-9',\
			"congestion/congestion_window-1-10.trace" using 1:2 with lines title 'Congestion window flux-1-10',\
			"congestion/congestion_window-1-11.trace" using 1:2 with lines title 'Congestion window flux-1-11',\
			"congestion/congestion_window-1-12.trace" using 1:2 with lines title 'Congestion window flux-1-12',\
			"congestion/congestion_window-1-13.trace" using 1:2 with lines title 'Congestion window flux-1-13',\
			"congestion/congestion_window-1-14.trace" using 1:2 with lines title 'Congestion window flux-1-14',\
			"congestion/congestion_window-1-15.trace" using 1:2 with lines title 'Congestion window flux-1-15',\
			"congestion/congestion_window-1-16.trace" using 1:2 with lines title 'Congestion window flux-1-16',\
			"congestion/congestion_window-1-17.trace" using 1:2 with lines title 'Congestion window flux-1-17',\
			"congestion/congestion_window-1-18.trace" using 1:2 with lines title 'Congestion window flux-1-18',\
			"congestion/congestion_window-1-19.trace" using 1:2 with lines title 'Congestion window flux-1-19',\
			"congestion/congestion_window-1-20.trace" using 1:2 with lines title 'Congestion window flux-1-20',\
			"congestion/congestion_window-1-21.trace" using 1:2 with lines title 'Congestion window flux-1-21',\
			"congestion/congestion_window-1-22.trace" using 1:2 with lines title 'Congestion window flux-1-22',\
			"congestion/congestion_window-1-24.trace" using 1:2 with lines title 'Congestion window flux-1-24'
EOF