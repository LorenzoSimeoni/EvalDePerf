set terminal pdf
set output 'queue/queue.pdf'

set xlabel "Time (seconds)"
set ylabel "Queue (packets)"
#set key 0.01,100

plot "queue/queue.tr" using 1:5 with lines title 'Taille de la queue entre les 2 noeuds principaux'

