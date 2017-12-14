gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-25-0.trace" using 1:2 with lines title 'Congestion window flux-25-0 ',\
			"congestion/congestion_window-25-1.trace" using 1:2 with lines title 'Congestion window flux-25-1',\
			"congestion/congestion_window-25-2.trace" using 1:2 with lines title 'Congestion window flux-25-2',\
			"congestion/congestion_window-25-3.trace" using 1:2 with lines title 'Congestion window flux-25-3',\
			"congestion/congestion_window-25-4.trace" using 1:2 with lines title 'Congestion window flux-25-4',\
			"congestion/congestion_window-25-5.trace" using 1:2 with lines title 'Congestion window flux-25-5',\
			"congestion/congestion_window-25-6.trace" using 1:2 with lines title 'Congestion window flux-25-6',\
			"congestion/congestion_window-25-9.trace" using 1:2 with lines title 'Congestion window flux-25-9',\
			"congestion/congestion_window-25-10.trace" using 1:2 with lines title 'Congestion window flux-25-10',\
			"congestion/congestion_window-25-11.trace" using 1:2 with lines title 'Congestion window flux-25-11',\
			"congestion/congestion_window-25-12.trace" using 1:2 with lines title 'Congestion window flux-25-12',\
			"congestion/congestion_window-25-13.trace" using 1:2 with lines title 'Congestion window flux-25-13',\
			"congestion/congestion_window-25-14.trace" using 1:2 with lines title 'Congestion window flux-25-14',\
			"congestion/congestion_window-25-15.trace" using 1:2 with lines title 'Congestion window flux-25-15',\
			"congestion/congestion_window-25-17.trace" using 1:2 with lines title 'Congestion window flux-25-17',\
			"congestion/congestion_window-25-19.trace" using 1:2 with lines title 'Congestion window flux-25-19',\
			"congestion/congestion_window-25-20.trace" using 1:2 with lines title 'Congestion window flux-25-20',\
			"congestion/congestion_window-25-21.trace" using 1:2 with lines title 'Congestion window flux-25-21',\
			"congestion/congestion_window-25-22.trace" using 1:2 with lines title 'Congestion window flux-25-22'
EOF