gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-17-0.trace" using 1:2 with lines title 'Congestion window flux-17-0 ',\
			"congestion/congestion_window-17-1.trace" using 1:2 with lines title 'Congestion window flux-17-1',\
			"congestion/congestion_window-17-2.trace" using 1:2 with lines title 'Congestion window flux-17-2',\
			"congestion/congestion_window-17-3.trace" using 1:2 with lines title 'Congestion window flux-17-3',\
			"congestion/congestion_window-17-4.trace" using 1:2 with lines title 'Congestion window flux-17-4',\
			"congestion/congestion_window-17-5.trace" using 1:2 with lines title 'Congestion window flux-17-5',\
			"congestion/congestion_window-17-6.trace" using 1:2 with lines title 'Congestion window flux-17-6',\
			"congestion/congestion_window-17-9.trace" using 1:2 with lines title 'Congestion window flux-17-9',\
			"congestion/congestion_window-17-10.trace" using 1:2 with lines title 'Congestion window flux-17-10',\
			"congestion/congestion_window-17-11.trace" using 1:2 with lines title 'Congestion window flux-17-11',\
			"congestion/congestion_window-17-12.trace" using 1:2 with lines title 'Congestion window flux-17-12',\
			"congestion/congestion_window-17-13.trace" using 1:2 with lines title 'Congestion window flux-17-13',\
			"congestion/congestion_window-17-14.trace" using 1:2 with lines title 'Congestion window flux-17-14',\
			"congestion/congestion_window-17-15.trace" using 1:2 with lines title 'Congestion window flux-17-15',\
			"congestion/congestion_window-17-16.trace" using 1:2 with lines title 'Congestion window flux-17-16',\
			"congestion/congestion_window-17-18.trace" using 1:2 with lines title 'Congestion window flux-17-18',\
			"congestion/congestion_window-17-19.trace" using 1:2 with lines title 'Congestion window flux-17-19',\
			"congestion/congestion_window-17-20.trace" using 1:2 with lines title 'Congestion window flux-17-20',\
			"congestion/congestion_window-17-21.trace" using 1:2 with lines title 'Congestion window flux-17-21',\
			"congestion/congestion_window-17-22.trace" using 1:2 with lines title 'Congestion window flux-17-22',\
			"congestion/congestion_window-17-24.trace" using 1:2 with lines title 'Congestion window flux-17-24'
EOF