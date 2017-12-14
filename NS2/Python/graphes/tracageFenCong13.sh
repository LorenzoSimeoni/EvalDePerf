gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"
	
		plot "congestion/congestion_window-13-0.trace" using 1:2 with lines title 'Congestion window flux-13-0 ',\
			"congestion/congestion_window-13-1.trace" using 1:2 with lines title 'Congestion window flux-13-1',\
			"congestion/congestion_window-13-2.trace" using 1:2 with lines title 'Congestion window flux-13-2',\
			"congestion/congestion_window-13-3.trace" using 1:2 with lines title 'Congestion window flux-13-3',\
			"congestion/congestion_window-13-4.trace" using 1:2 with lines title 'Congestion window flux-13-4',\
			"congestion/congestion_window-13-5.trace" using 1:2 with lines title 'Congestion window flux-13-5',\
			"congestion/congestion_window-13-6.trace" using 1:2 with lines title 'Congestion window flux-13-6',\
			"congestion/congestion_window-13-9.trace" using 1:2 with lines title 'Congestion window flux-13-9',\
			"congestion/congestion_window-13-10.trace" using 1:2 with lines title 'Congestion window flux-13-10',\
			"congestion/congestion_window-13-11.trace" using 1:2 with lines title 'Congestion window flux-13-11',\
			"congestion/congestion_window-13-12.trace" using 1:2 with lines title 'Congestion window flux-13-12',\
			"congestion/congestion_window-13-14.trace" using 1:2 with lines title 'Congestion window flux-13-14',\
			"congestion/congestion_window-13-15.trace" using 1:2 with lines title 'Congestion window flux-13-15',\
			"congestion/congestion_window-13-16.trace" using 1:2 with lines title 'Congestion window flux-13-16',\
			"congestion/congestion_window-13-17.trace" using 1:2 with lines title 'Congestion window flux-13-17',\
			"congestion/congestion_window-13-18.trace" using 1:2 with lines title 'Congestion window flux-13-18',\
			"congestion/congestion_window-13-20.trace" using 1:2 with lines title 'Congestion window flux-13-20',\
			"congestion/congestion_window-13-21.trace" using 1:2 with lines title 'Congestion window flux-13-21',\
			"congestion/congestion_window-13-22.trace" using 1:2 with lines title 'Congestion window flux-13-22',\
			"congestion/congestion_window-13-24.trace" using 1:2 with lines title 'Congestion window flux-13-24'
EOF