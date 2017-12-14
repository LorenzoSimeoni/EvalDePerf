gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

			plot "congestion/congestion_window-6-0.trace" using 1:2 with lines title 'Congestion window flux-6-0 ',\
			"congestion/congestion_window-6-1.trace" using 1:2 with lines title 'Congestion window flux-6-1',\
			"congestion/congestion_window-6-2.trace" using 1:2 with lines title 'Congestion window flux-6-2',\
			"congestion/congestion_window-6-3.trace" using 1:2 with lines title 'Congestion window flux-6-3',\
			"congestion/congestion_window-6-4.trace" using 1:2 with lines title 'Congestion window flux-6-4',\
			"congestion/congestion_window-6-5.trace" using 1:2 with lines title 'Congestion window flux-6-5',\
			"congestion/congestion_window-6-9.trace" using 1:2 with lines title 'Congestion window flux-6-9',\
			"congestion/congestion_window-6-10.trace" using 1:2 with lines title 'Congestion window flux-6-10',\
			"congestion/congestion_window-6-11.trace" using 1:2 with lines title 'Congestion window flux-6-11',\
			"congestion/congestion_window-6-12.trace" using 1:2 with lines title 'Congestion window flux-6-12',\
			"congestion/congestion_window-6-13.trace" using 1:2 with lines title 'Congestion window flux-6-13',\
			"congestion/congestion_window-6-14.trace" using 1:2 with lines title 'Congestion window flux-6-14',\
			"congestion/congestion_window-6-15.trace" using 1:2 with lines title 'Congestion window flux-6-15',\
			"congestion/congestion_window-6-16.trace" using 1:2 with lines title 'Congestion window flux-6-16',\
			"congestion/congestion_window-6-17.trace" using 1:2 with lines title 'Congestion window flux-6-17',\
			"congestion/congestion_window-6-18.trace" using 1:2 with lines title 'Congestion window flux-6-18',\
			"congestion/congestion_window-6-19.trace" using 1:2 with lines title 'Congestion window flux-6-19',\
			"congestion/congestion_window-6-20.trace" using 1:2 with lines title 'Congestion window flux-6-20',\
			"congestion/congestion_window-6-21.trace" using 1:2 with lines title 'Congestion window flux-6-21',\
			"congestion/congestion_window-6-22.trace" using 1:2 with lines title 'Congestion window flux-6-22',\
			"congestion/congestion_window-6-24.trace" using 1:2 with lines title 'Congestion window flux-6-24'
EOF