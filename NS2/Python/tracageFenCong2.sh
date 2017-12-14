gnuplot -p << EOF

	set xlabel "Temps (s)"
	set ylabel"Fenêtre de congestion (paquets)"

		plot "congestion/congestion_window-2-0.trace" using 1:2 with lines title 'Congestion window flux-2-0 ',\
			"congestion/congestion_window-2-1.trace" using 1:2 with lines title 'Congestion window flux-2-1',\
			"congestion/congestion_window-2-3.trace" using 1:2 with lines title 'Congestion window flux-2-3',\
			"congestion/congestion_window-2-4.trace" using 1:2 with lines title 'Congestion window flux-2-4',\
			"congestion/congestion_window-2-5.trace" using 1:2 with lines title 'Congestion window flux-2-5',\
			"congestion/congestion_window-2-6.trace" using 1:2 with lines title 'Congestion window flux-2-6',\
			"congestion/congestion_window-2-9.trace" using 1:2 with lines title 'Congestion window flux-2-9',\
			"congestion/congestion_window-2-10.trace" using 1:2 with lines title 'Congestion window flux-2-10',\
			"congestion/congestion_window-2-11.trace" using 1:2 with lines title 'Congestion window flux-2-11',\
			"congestion/congestion_window-2-12.trace" using 1:2 with lines title 'Congestion window flux-2-12',\
			"congestion/congestion_window-2-13.trace" using 1:2 with lines title 'Congestion window flux-2-13',\
			"congestion/congestion_window-2-14.trace" using 1:2 with lines title 'Congestion window flux-2-14',\
			"congestion/congestion_window-2-15.trace" using 1:2 with lines title 'Congestion window flux-2-15',\
			"congestion/congestion_window-2-16.trace" using 1:2 with lines title 'Congestion window flux-2-16',\
			"congestion/congestion_window-2-17.trace" using 1:2 with lines title 'Congestion window flux-2-17',\
			"congestion/congestion_window-2-18.trace" using 1:2 with lines title 'Congestion window flux-2-18',\
			"congestion/congestion_window-2-19.trace" using 1:2 with lines title 'Congestion window flux-2-19',\
			"congestion/congestion_window-2-20.trace" using 1:2 with lines title 'Congestion window flux-2-20',\
			"congestion/congestion_window-2-21.trace" using 1:2 with lines title 'Congestion window flux-2-21',\
			"congestion/congestion_window-2-22.trace" using 1:2 with lines title 'Congestion window flux-2-22',\
			"congestion/congestion_window-2-24.trace" using 1:2 with lines title 'Congestion window flux-2-24'
EOF
