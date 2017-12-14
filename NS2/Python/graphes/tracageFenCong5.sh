gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-5-0.trace" using 1:2 with lines title 'Congestion window flux-5-0 ',\
			"congestion/congestion_window-5-1.trace" using 1:2 with lines title 'Congestion window flux-5-1',\
			"congestion/congestion_window-5-2.trace" using 1:2 with lines title 'Congestion window flux-5-2',\
			"congestion/congestion_window-5-3.trace" using 1:2 with lines title 'Congestion window flux-5-3',\
			"congestion/congestion_window-5-4.trace" using 1:2 with lines title 'Congestion window flux-5-4',\
			"congestion/congestion_window-5-6.trace" using 1:2 with lines title 'Congestion window flux-5-6',\
			"congestion/congestion_window-5-9.trace" using 1:2 with lines title 'Congestion window flux-5-9',\
			"congestion/congestion_window-5-10.trace" using 1:2 with lines title 'Congestion window flux-5-10',\
			"congestion/congestion_window-5-11.trace" using 1:2 with lines title 'Congestion window flux-5-11',\
			"congestion/congestion_window-5-12.trace" using 1:2 with lines title 'Congestion window flux-5-12',\
			"congestion/congestion_window-5-13.trace" using 1:2 with lines title 'Congestion window flux-5-13',\
			"congestion/congestion_window-5-14.trace" using 1:2 with lines title 'Congestion window flux-5-14',\
			"congestion/congestion_window-5-15.trace" using 1:2 with lines title 'Congestion window flux-5-15',\
			"congestion/congestion_window-5-16.trace" using 1:2 with lines title 'Congestion window flux-5-16',\
			"congestion/congestion_window-5-17.trace" using 1:2 with lines title 'Congestion window flux-5-17',\
			"congestion/congestion_window-5-18.trace" using 1:2 with lines title 'Congestion window flux-5-18',\
			"congestion/congestion_window-5-19.trace" using 1:2 with lines title 'Congestion window flux-5-19',\
			"congestion/congestion_window-5-20.trace" using 1:2 with lines title 'Congestion window flux-5-20',\
			"congestion/congestion_window-5-21.trace" using 1:2 with lines title 'Congestion window flux-5-21',\
			"congestion/congestion_window-5-22.trace" using 1:2 with lines title 'Congestion window flux-5-22',\
			"congestion/congestion_window-5-24.trace" using 1:2 with lines title 'Congestion window flux-5-24'
EOF