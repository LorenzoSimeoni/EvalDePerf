gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-24-0.trace" using 1:2 with lines title 'Congestion window flux-24-0 ',\
			"congestion/congestion_window-24-1.trace" using 1:2 with lines title 'Congestion window flux-24-1',\
			"congestion/congestion_window-24-2.trace" using 1:2 with lines title 'Congestion window flux-24-2',\
			"congestion/congestion_window-24-3.trace" using 1:2 with lines title 'Congestion window flux-24-3',\
			"congestion/congestion_window-24-4.trace" using 1:2 with lines title 'Congestion window flux-24-4',\
			"congestion/congestion_window-24-5.trace" using 1:2 with lines title 'Congestion window flux-24-5',\
			"congestion/congestion_window-24-6.trace" using 1:2 with lines title 'Congestion window flux-24-6',\
			"congestion/congestion_window-24-9.trace" using 1:2 with lines title 'Congestion window flux-24-9',\
			"congestion/congestion_window-24-10.trace" using 1:2 with lines title 'Congestion window flux-24-10',\
			"congestion/congestion_window-24-11.trace" using 1:2 with lines title 'Congestion window flux-24-11',\
			"congestion/congestion_window-24-12.trace" using 1:2 with lines title 'Congestion window flux-24-12',\
			"congestion/congestion_window-24-13.trace" using 1:2 with lines title 'Congestion window flux-24-13',\
			"congestion/congestion_window-24-14.trace" using 1:2 with lines title 'Congestion window flux-24-14',\
			"congestion/congestion_window-24-15.trace" using 1:2 with lines title 'Congestion window flux-24-15',\
			"congestion/congestion_window-24-16.trace" using 1:2 with lines title 'Congestion window flux-24-16',\
			"congestion/congestion_window-24-17.trace" using 1:2 with lines title 'Congestion window flux-24-17',\
			"congestion/congestion_window-24-19.trace" using 1:2 with lines title 'Congestion window flux-24-19',\
			"congestion/congestion_window-24-20.trace" using 1:2 with lines title 'Congestion window flux-24-20',\
			"congestion/congestion_window-24-21.trace" using 1:2 with lines title 'Congestion window flux-24-21',\
			"congestion/congestion_window-24-22.trace" using 1:2 with lines title 'Congestion window flux-24-22'
EOF