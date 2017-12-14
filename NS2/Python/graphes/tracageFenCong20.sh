gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-20-0.trace" using 1:2 with lines title 'Congestion window flux-20-0 ',\
			"congestion/congestion_window-20-1.trace" using 1:2 with lines title 'Congestion window flux-20-1',\
			"congestion/congestion_window-20-2.trace" using 1:2 with lines title 'Congestion window flux-20-2',\
			"congestion/congestion_window-20-3.trace" using 1:2 with lines title 'Congestion window flux-20-3',\
			"congestion/congestion_window-20-4.trace" using 1:2 with lines title 'Congestion window flux-20-4',\
			"congestion/congestion_window-20-5.trace" using 1:2 with lines title 'Congestion window flux-20-5',\
			"congestion/congestion_window-20-6.trace" using 1:2 with lines title 'Congestion window flux-20-6',\
			"congestion/congestion_window-20-9.trace" using 1:2 with lines title 'Congestion window flux-20-9',\
			"congestion/congestion_window-20-10.trace" using 1:2 with lines title 'Congestion window flux-20-10',\
			"congestion/congestion_window-20-11.trace" using 1:2 with lines title 'Congestion window flux-20-11',\
			"congestion/congestion_window-20-12.trace" using 1:2 with lines title 'Congestion window flux-20-12',\
			"congestion/congestion_window-20-13.trace" using 1:2 with lines title 'Congestion window flux-20-13',\
			"congestion/congestion_window-20-14.trace" using 1:2 with lines title 'Congestion window flux-20-14',\
			"congestion/congestion_window-20-15.trace" using 1:2 with lines title 'Congestion window flux-20-15',\
			"congestion/congestion_window-20-16.trace" using 1:2 with lines title 'Congestion window flux-20-16',\
			"congestion/congestion_window-20-17.trace" using 1:2 with lines title 'Congestion window flux-20-17',\
			"congestion/congestion_window-20-18.trace" using 1:2 with lines title 'Congestion window flux-20-18',\
			"congestion/congestion_window-20-19.trace" using 1:2 with lines title 'Congestion window flux-20-19',\
			"congestion/congestion_window-20-21.trace" using 1:2 with lines title 'Congestion window flux-20-21',\
			"congestion/congestion_window-20-22.trace" using 1:2 with lines title 'Congestion window flux-20-22',\
			"congestion/congestion_window-20-24.trace" using 1:2 with lines title 'Congestion window flux-20-24'
EOF