gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-18-0.trace" using 1:2 with lines title 'Congestion window flux-18-0 ',\
			"congestion/congestion_window-18-1.trace" using 1:2 with lines title 'Congestion window flux-18-1',\
			"congestion/congestion_window-18-2.trace" using 1:2 with lines title 'Congestion window flux-18-2',\
			"congestion/congestion_window-18-3.trace" using 1:2 with lines title 'Congestion window flux-18-3',\
			"congestion/congestion_window-18-4.trace" using 1:2 with lines title 'Congestion window flux-18-4',\
			"congestion/congestion_window-18-5.trace" using 1:2 with lines title 'Congestion window flux-18-5',\
			"congestion/congestion_window-18-6.trace" using 1:2 with lines title 'Congestion window flux-18-6',\
			"congestion/congestion_window-18-9.trace" using 1:2 with lines title 'Congestion window flux-18-9',\
			"congestion/congestion_window-18-10.trace" using 1:2 with lines title 'Congestion window flux-18-10',\
			"congestion/congestion_window-18-11.trace" using 1:2 with lines title 'Congestion window flux-18-11',\
			"congestion/congestion_window-18-12.trace" using 1:2 with lines title 'Congestion window flux-18-12',\
			"congestion/congestion_window-18-13.trace" using 1:2 with lines title 'Congestion window flux-18-13',\
			"congestion/congestion_window-18-14.trace" using 1:2 with lines title 'Congestion window flux-18-14',\
			"congestion/congestion_window-18-15.trace" using 1:2 with lines title 'Congestion window flux-18-15',\
			"congestion/congestion_window-18-16.trace" using 1:2 with lines title 'Congestion window flux-18-16',\
			"congestion/congestion_window-18-17.trace" using 1:2 with lines title 'Congestion window flux-18-17',\
			"congestion/congestion_window-18-19.trace" using 1:2 with lines title 'Congestion window flux-18-19',\
			"congestion/congestion_window-18-20.trace" using 1:2 with lines title 'Congestion window flux-18-20',\
			"congestion/congestion_window-18-21.trace" using 1:2 with lines title 'Congestion window flux-18-21',\
			"congestion/congestion_window-18-22.trace" using 1:2 with lines title 'Congestion window flux-18-22'
EOF