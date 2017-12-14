gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-19-0.trace" using 1:2 with lines title 'Congestion window flux-19-0 ',\
			"congestion/congestion_window-19-1.trace" using 1:2 with lines title 'Congestion window flux-19-1',\
			"congestion/congestion_window-19-2.trace" using 1:2 with lines title 'Congestion window flux-19-2',\
			"congestion/congestion_window-19-3.trace" using 1:2 with lines title 'Congestion window flux-19-3',\
			"congestion/congestion_window-19-4.trace" using 1:2 with lines title 'Congestion window flux-19-4',\
			"congestion/congestion_window-19-5.trace" using 1:2 with lines title 'Congestion window flux-19-5',\
			"congestion/congestion_window-19-6.trace" using 1:2 with lines title 'Congestion window flux-19-6',\
			"congestion/congestion_window-19-9.trace" using 1:2 with lines title 'Congestion window flux-19-9',\
			"congestion/congestion_window-19-10.trace" using 1:2 with lines title 'Congestion window flux-19-10',\
			"congestion/congestion_window-19-11.trace" using 1:2 with lines title 'Congestion window flux-19-11',\
			"congestion/congestion_window-19-12.trace" using 1:2 with lines title 'Congestion window flux-19-12',\
			"congestion/congestion_window-19-14.trace" using 1:2 with lines title 'Congestion window flux-19-14',\
			"congestion/congestion_window-19-15.trace" using 1:2 with lines title 'Congestion window flux-19-15',\
			"congestion/congestion_window-19-16.trace" using 1:2 with lines title 'Congestion window flux-19-16',\
			"congestion/congestion_window-19-17.trace" using 1:2 with lines title 'Congestion window flux-19-17',\
			"congestion/congestion_window-19-18.trace" using 1:2 with lines title 'Congestion window flux-19-18',\
			"congestion/congestion_window-19-20.trace" using 1:2 with lines title 'Congestion window flux-19-20',\
			"congestion/congestion_window-19-21.trace" using 1:2 with lines title 'Congestion window flux-19-21',\
			"congestion/congestion_window-19-24.trace" using 1:2 with lines title 'Congestion window flux-19-24'
EOF