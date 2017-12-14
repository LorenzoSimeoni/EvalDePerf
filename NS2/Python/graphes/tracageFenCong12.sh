gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-12-0.trace" using 1:2 with lines title 'Congestion window flux-12-0 ',\
			"congestion/congestion_window-12-1.trace" using 1:2 with lines title 'Congestion window flux-12-1',\
			"congestion/congestion_window-12-2.trace" using 1:2 with lines title 'Congestion window flux-12-2',\
			"congestion/congestion_window-12-3.trace" using 1:2 with lines title 'Congestion window flux-12-3',\
			"congestion/congestion_window-12-4.trace" using 1:2 with lines title 'Congestion window flux-12-4',\
			"congestion/congestion_window-12-5.trace" using 1:2 with lines title 'Congestion window flux-12-5',\
			"congestion/congestion_window-12-6.trace" using 1:2 with lines title 'Congestion window flux-12-6',\
			"congestion/congestion_window-12-9.trace" using 1:2 with lines title 'Congestion window flux-12-9',\
			"congestion/congestion_window-12-10.trace" using 1:2 with lines title 'Congestion window flux-12-10',\
			"congestion/congestion_window-12-11.trace" using 1:2 with lines title 'Congestion window flux-12-11',\
			"congestion/congestion_window-12-13.trace" using 1:2 with lines title 'Congestion window flux-12-13',\
			"congestion/congestion_window-12-14.trace" using 1:2 with lines title 'Congestion window flux-12-14',\
			"congestion/congestion_window-12-15.trace" using 1:2 with lines title 'Congestion window flux-12-15',\
			"congestion/congestion_window-12-16.trace" using 1:2 with lines title 'Congestion window flux-12-16',\
			"congestion/congestion_window-12-17.trace" using 1:2 with lines title 'Congestion window flux-12-17',\
			"congestion/congestion_window-12-18.trace" using 1:2 with lines title 'Congestion window flux-12-18',\
			"congestion/congestion_window-12-19.trace" using 1:2 with lines title 'Congestion window flux-12-19',\
			"congestion/congestion_window-12-20.trace" using 1:2 with lines title 'Congestion window flux-12-20',\
			"congestion/congestion_window-12-21.trace" using 1:2 with lines title 'Congestion window flux-12-21',\
			"congestion/congestion_window-12-22.trace" using 1:2 with lines title 'Congestion window flux-12-22',\
			"congestion/congestion_window-12-24.trace" using 1:2 with lines title 'Congestion window flux-12-24'
EOF