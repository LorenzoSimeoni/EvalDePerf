set terminal pdf
set output 'congestion/congestion_window.pdf'


set xlabel "Time (seconds)"
set ylabel "Window (packets)"
#set key 0.01,100


plot "congestion/congestion_window-0-0.trace" using 1:2 with lines title 'Congestion window flux 1',\
	"congestion/congestion_window-0-1.trace" using 1:2 with lines title 'Congestion window flux 2',\
	"congestion/congestion_window-0-2.trace" using 1:2 with lines title 'Congestion window flux 3'
plot "congestion/congestion_window-1-0.trace" using 1:2 with lines title 'Congestion window flux 4',\
	"congestion/congestion_window-1-1.trace" using 1:2 with lines title 'Congestion window flux 5',\
	"congestion/congestion_window-1-2.trace" using 1:2 with lines title 'Congestion window flux 6'
plot "congestion/congestion_window-0-0.trace" using 1:2 with lines title 'Congestion window flux 1'
plot "congestion/congestion_window-0-1.trace" using 1:2 with lines title 'Congestion window flux 2'
plot "congestion/congestion_window-0-2.trace" using 1:2 with lines title 'Congestion window flux 3'
plot "congestion/congestion_window-1-0.trace" using 1:2 with lines title 'Congestion window flux 4'
plot "congestion/congestion_window-1-1.trace" using 1:2 with lines title 'Congestion window flux 5'
plot "congestion/congestion_window-1-2.trace" using 1:2 with lines title 'Congestion window flux 6'
