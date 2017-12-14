gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

			plot "congestion/congestion_window-10-0.trace" using 1:2 with lines title 'Congestion window flux-10-0 ',\
			"congestion/congestion_window-10-1.trace" using 1:2 with lines title 'Congestion window flux-10-1',\
			"congestion/congestion_window-10-2.trace" using 1:2 with lines title 'Congestion window flux-10-2',\
			"congestion/congestion_window-10-3.trace" using 1:2 with lines title 'Congestion window flux-10-3',\
			"congestion/congestion_window-10-4.trace" using 1:2 with lines title 'Congestion window flux-10-4',\
			"congestion/congestion_window-10-5.trace" using 1:2 with lines title 'Congestion window flux-10-5',\
			"congestion/congestion_window-10-6.trace" using 1:2 with lines title 'Congestion window flux-10-6',\
			"congestion/congestion_window-10-12.trace" using 1:2 with lines title 'Congestion window flux-10-12',\
			"congestion/congestion_window-10-13.trace" using 1:2 with lines title 'Congestion window flux-10-13',\
			"congestion/congestion_window-10-14.trace" using 1:2 with lines title 'Congestion window flux-10-14',\
			"congestion/congestion_window-10-15.trace" using 1:2 with lines title 'Congestion window flux-10-15',\
			"congestion/congestion_window-10-16.trace" using 1:2 with lines title 'Congestion window flux-10-16',\
			"congestion/congestion_window-10-17.trace" using 1:2 with lines title 'Congestion window flux-10-17',\
			"congestion/congestion_window-10-18.trace" using 1:2 with lines title 'Congestion window flux-10-18',\
			"congestion/congestion_window-10-19.trace" using 1:2 with lines title 'Congestion window flux-10-19',\
			"congestion/congestion_window-10-20.trace" using 1:2 with lines title 'Congestion window flux-10-20',\
			"congestion/congestion_window-10-21.trace" using 1:2 with lines title 'Congestion window flux-10-21',\
			"congestion/congestion_window-10-24.trace" using 1:2 with lines title 'Congestion window flux-10-24'
EOF