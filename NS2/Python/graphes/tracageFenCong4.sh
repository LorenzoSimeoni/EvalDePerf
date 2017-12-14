gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-4-0.trace" using 1:2 with lines title 'Congestion window flux-4-0 ',\
			"congestion/congestion_window-4-1.trace" using 1:2 with lines title 'Congestion window flux-4-1',\
			"congestion/congestion_window-4-2.trace" using 1:2 with lines title 'Congestion window flux-4-2',\
			"congestion/congestion_window-4-3.trace" using 1:2 with lines title 'Congestion window flux-4-3',\
			"congestion/congestion_window-4-5.trace" using 1:2 with lines title 'Congestion window flux-4-5',\
			"congestion/congestion_window-4-6.trace" using 1:2 with lines title 'Congestion window flux-4-6',\
			"congestion/congestion_window-4-9.trace" using 1:2 with lines title 'Congestion window flux-4-9',\
			"congestion/congestion_window-4-10.trace" using 1:2 with lines title 'Congestion window flux-4-10',\
			"congestion/congestion_window-4-11.trace" using 1:2 with lines title 'Congestion window flux-4-11',\
			"congestion/congestion_window-4-12.trace" using 1:2 with lines title 'Congestion window flux-4-12',\
			"congestion/congestion_window-4-13.trace" using 1:2 with lines title 'Congestion window flux-4-13',\
			"congestion/congestion_window-4-14.trace" using 1:2 with lines title 'Congestion window flux-4-14',\
			"congestion/congestion_window-4-15.trace" using 1:2 with lines title 'Congestion window flux-4-15',\
			"congestion/congestion_window-4-16.trace" using 1:2 with lines title 'Congestion window flux-4-16',\
			"congestion/congestion_window-4-17.trace" using 1:2 with lines title 'Congestion window flux-4-17',\
			"congestion/congestion_window-4-18.trace" using 1:2 with lines title 'Congestion window flux-4-18',\
			"congestion/congestion_window-4-19.trace" using 1:2 with lines title 'Congestion window flux-4-19',\
			"congestion/congestion_window-4-20.trace" using 1:2 with lines title 'Congestion window flux-4-20',\
			"congestion/congestion_window-4-21.trace" using 1:2 with lines title 'Congestion window flux-4-21',\
			"congestion/congestion_window-4-22.trace" using 1:2 with lines title 'Congestion window flux-4-22',\
			"congestion/congestion_window-4-24.trace" using 1:2 with lines title 'Congestion window flux-4-24'
EOF