gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-14-0.trace" using 1:2 with lines title 'Congestion window flux-14-0 ',\
			"congestion/congestion_window-14-1.trace" using 1:2 with lines title 'Congestion window flux-14-1',\
			"congestion/congestion_window-14-2.trace" using 1:2 with lines title 'Congestion window flux-14-2',\
			"congestion/congestion_window-14-3.trace" using 1:2 with lines title 'Congestion window flux-14-3',\
			"congestion/congestion_window-14-4.trace" using 1:2 with lines title 'Congestion window flux-14-4',\
			"congestion/congestion_window-14-5.trace" using 1:2 with lines title 'Congestion window flux-14-5',\
			"congestion/congestion_window-14-6.trace" using 1:2 with lines title 'Congestion window flux-14-6',\
			"congestion/congestion_window-14-9.trace" using 1:2 with lines title 'Congestion window flux-14-9',\
			"congestion/congestion_window-14-10.trace" using 1:2 with lines title 'Congestion window flux-14-10',\
			"congestion/congestion_window-14-11.trace" using 1:2 with lines title 'Congestion window flux-14-11',\
			"congestion/congestion_window-14-12.trace" using 1:2 with lines title 'Congestion window flux-14-12',\
			"congestion/congestion_window-14-13.trace" using 1:2 with lines title 'Congestion window flux-14-13',\
			"congestion/congestion_window-14-15.trace" using 1:2 with lines title 'Congestion window flux-14-15',\
			"congestion/congestion_window-14-16.trace" using 1:2 with lines title 'Congestion window flux-14-16',\
			"congestion/congestion_window-14-17.trace" using 1:2 with lines title 'Congestion window flux-14-17',\
			"congestion/congestion_window-14-18.trace" using 1:2 with lines title 'Congestion window flux-14-18',\
			"congestion/congestion_window-14-20.trace" using 1:2 with lines title 'Congestion window flux-14-20',\
			"congestion/congestion_window-14-21.trace" using 1:2 with lines title 'Congestion window flux-14-21',\
			"congestion/congestion_window-14-22.trace" using 1:2 with lines title 'Congestion window flux-14-22',\
			"congestion/congestion_window-14-24.trace" using 1:2 with lines title 'Congestion window flux-14-24'
EOF