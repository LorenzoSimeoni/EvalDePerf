gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-16-0.trace" using 1:2 with lines title 'Congestion window flux-16-0 ',\
			"congestion/congestion_window-16-1.trace" using 1:2 with lines title 'Congestion window flux-16-1',\
			"congestion/congestion_window-16-2.trace" using 1:2 with lines title 'Congestion window flux-16-2',\
			"congestion/congestion_window-16-3.trace" using 1:2 with lines title 'Congestion window flux-16-3',\
			"congestion/congestion_window-16-4.trace" using 1:2 with lines title 'Congestion window flux-16-4',\
			"congestion/congestion_window-16-5.trace" using 1:2 with lines title 'Congestion window flux-16-5',\
			"congestion/congestion_window-16-6.trace" using 1:2 with lines title 'Congestion window flux-16-6',\
			"congestion/congestion_window-16-9.trace" using 1:2 with lines title 'Congestion window flux-16-9',\
			"congestion/congestion_window-16-10.trace" using 1:2 with lines title 'Congestion window flux-16-10',\
			"congestion/congestion_window-16-12.trace" using 1:2 with lines title 'Congestion window flux-16-12',\
			"congestion/congestion_window-16-13.trace" using 1:2 with lines title 'Congestion window flux-16-13',\
			"congestion/congestion_window-16-14.trace" using 1:2 with lines title 'Congestion window flux-16-14',\
			"congestion/congestion_window-16-15.trace" using 1:2 with lines title 'Congestion window flux-16-15',\
			"congestion/congestion_window-16-17.trace" using 1:2 with lines title 'Congestion window flux-16-17',\
			"congestion/congestion_window-16-18.trace" using 1:2 with lines title 'Congestion window flux-16-18',\
			"congestion/congestion_window-16-19.trace" using 1:2 with lines title 'Congestion window flux-16-19',\
			"congestion/congestion_window-16-20.trace" using 1:2 with lines title 'Congestion window flux-16-20',\
			"congestion/congestion_window-16-21.trace" using 1:2 with lines title 'Congestion window flux-16-21',\
			"congestion/congestion_window-16-22.trace" using 1:2 with lines title 'Congestion window flux-16-22',\
			"congestion/congestion_window-16-24.trace" using 1:2 with lines title 'Congestion window flux-16-24'
EOF