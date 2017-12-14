gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-0-1.trace" using 1:2 with lines title 'Congestion window flux-0-1 ',\
			"congestion/congestion_window-0-2.trace" using 1:2 with lines title 'Congestion window flux-0-2',\
			"congestion/congestion_window-0-3.trace" using 1:2 with lines title 'Congestion window flux-0-3',\
			"congestion/congestion_window-0-4.trace" using 1:2 with lines title 'Congestion window flux-0-4',\
			"congestion/congestion_window-0-5.trace" using 1:2 with lines title 'Congestion window flux-0-5',\
			"congestion/congestion_window-0-6.trace" using 1:2 with lines title 'Congestion window flux-0-6',\
			"congestion/congestion_window-0-9.trace" using 1:2 with lines title 'Congestion window flux-0-9',\
			"congestion/congestion_window-0-10.trace" using 1:2 with lines title 'Congestion window flux-0-10',\
			"congestion/congestion_window-0-11.trace" using 1:2 with lines title 'Congestion window flux-0-11',\
			"congestion/congestion_window-0-12.trace" using 1:2 with lines title 'Congestion window flux-0-12',\
			"congestion/congestion_window-0-13.trace" using 1:2 with lines title 'Congestion window flux-0-13',\
			"congestion/congestion_window-0-14.trace" using 1:2 with lines title 'Congestion window flux-0-14',\
			"congestion/congestion_window-0-15.trace" using 1:2 with lines title 'Congestion window flux-0-15',\
			"congestion/congestion_window-0-16.trace" using 1:2 with lines title 'Congestion window flux-0-16',\
			"congestion/congestion_window-0-17.trace" using 1:2 with lines title 'Congestion window flux-0-17',\
			"congestion/congestion_window-0-18.trace" using 1:2 with lines title 'Congestion window flux-0-18',\
			"congestion/congestion_window-0-19.trace" using 1:2 with lines title 'Congestion window flux-0-19',\
			"congestion/congestion_window-0-20.trace" using 1:2 with lines title 'Congestion window flux-0-20',\
			"congestion/congestion_window-0-21.trace" using 1:2 with lines title 'Congestion window flux-0-21',\
			"congestion/congestion_window-0-22.trace" using 1:2 with lines title 'Congestion window flux-0-22',\
			"congestion/congestion_window-0-24.trace" using 1:2 with lines title 'Congestion window flux-0-24'
EOF