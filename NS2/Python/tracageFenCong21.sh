gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-21-0.trace" using 1:2 with lines title 'Congestion window flux-21-0 ',\
			"congestion/congestion_window-21-1.trace" using 1:2 with lines title 'Congestion window flux-21-1',\
			"congestion/congestion_window-21-2.trace" using 1:2 with lines title 'Congestion window flux-21-2',\
			"congestion/congestion_window-21-3.trace" using 1:2 with lines title 'Congestion window flux-21-3',\
			"congestion/congestion_window-21-4.trace" using 1:2 with lines title 'Congestion window flux-21-4',\
			"congestion/congestion_window-21-5.trace" using 1:2 with lines title 'Congestion window flux-21-5',\
			"congestion/congestion_window-21-6.trace" using 1:2 with lines title 'Congestion window flux-21-6',\
			"congestion/congestion_window-21-9.trace" using 1:2 with lines title 'Congestion window flux-21-9',\
			"congestion/congestion_window-21-10.trace" using 1:2 with lines title 'Congestion window flux-21-10',\
			"congestion/congestion_window-21-11.trace" using 1:2 with lines title 'Congestion window flux-21-11',\
			"congestion/congestion_window-21-12.trace" using 1:2 with lines title 'Congestion window flux-21-12',\
			"congestion/congestion_window-21-13.trace" using 1:2 with lines title 'Congestion window flux-21-13',\
			"congestion/congestion_window-21-14.trace" using 1:2 with lines title 'Congestion window flux-21-14',\
			"congestion/congestion_window-21-15.trace" using 1:2 with lines title 'Congestion window flux-21-15',\
			"congestion/congestion_window-21-16.trace" using 1:2 with lines title 'Congestion window flux-21-16',\
			"congestion/congestion_window-21-17.trace" using 1:2 with lines title 'Congestion window flux-21-17',\
			"congestion/congestion_window-21-18.trace" using 1:2 with lines title 'Congestion window flux-21-18',\
			"congestion/congestion_window-21-20.trace" using 1:2 with lines title 'Congestion window flux-21-20',\
			"congestion/congestion_window-21-22.trace" using 1:2 with lines title 'Congestion window flux-21-22',\
			"congestion/congestion_window-21-24.trace" using 1:2 with lines title 'Congestion window flux-21-24'
EOF