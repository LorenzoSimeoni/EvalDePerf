gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-3-0.trace" using 1:2 with lines title 'Congestion window flux-3-0 ',\
			"congestion/congestion_window-3-1.trace" using 1:2 with lines title 'Congestion window flux-3-1',\
			"congestion/congestion_window-3-2.trace" using 1:2 with lines title 'Congestion window flux-3-2',\
			"congestion/congestion_window-3-4.trace" using 1:2 with lines title 'Congestion window flux-3-4',\
			"congestion/congestion_window-3-5.trace" using 1:2 with lines title 'Congestion window flux-3-5',\
			"congestion/congestion_window-3-6.trace" using 1:2 with lines title 'Congestion window flux-3-6',\
			"congestion/congestion_window-3-9.trace" using 1:2 with lines title 'Congestion window flux-3-9',\
			"congestion/congestion_window-3-10.trace" using 1:2 with lines title 'Congestion window flux-3-10',\
			"congestion/congestion_window-3-11.trace" using 1:2 with lines title 'Congestion window flux-3-11',\
			"congestion/congestion_window-3-12.trace" using 1:2 with lines title 'Congestion window flux-3-12',\
			"congestion/congestion_window-3-13.trace" using 1:2 with lines title 'Congestion window flux-3-13',\
			"congestion/congestion_window-3-14.trace" using 1:2 with lines title 'Congestion window flux-3-14',\
			"congestion/congestion_window-3-15.trace" using 1:2 with lines title 'Congestion window flux-3-15',\
			"congestion/congestion_window-3-16.trace" using 1:2 with lines title 'Congestion window flux-3-16',\
			"congestion/congestion_window-3-17.trace" using 1:2 with lines title 'Congestion window flux-3-17',\
			"congestion/congestion_window-3-18.trace" using 1:2 with lines title 'Congestion window flux-3-18',\
			"congestion/congestion_window-3-19.trace" using 1:2 with lines title 'Congestion window flux-3-19',\
			"congestion/congestion_window-3-20.trace" using 1:2 with lines title 'Congestion window flux-3-20',\
			"congestion/congestion_window-3-21.trace" using 1:2 with lines title 'Congestion window flux-3-21',\
			"congestion/congestion_window-3-22.trace" using 1:2 with lines title 'Congestion window flux-3-22',\
			"congestion/congestion_window-3-24.trace" using 1:2 with lines title 'Congestion window flux-3-24'
EOF