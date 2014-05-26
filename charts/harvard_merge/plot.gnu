#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,9 dashlength 3.5
set output "harvard_merge.eps"
set size 1.7,0.9

set xtics font "Times-Roman, 46" 
set yrange [0:60]
set xrange [0.5:40.5]
set ytics font "Times-Roman, 46" 

set tmargin 0.5 
set bmargin 3
#set lmargin 7
set rmargin 0.5

set xlabel "Elasped time (day)" offset 0, 0.4 font ', 48'
set ylabel "Avg. merges per 1000 writes" offset 1.4, -0.5 font ', 44'

set key top left box lw 2 reverse Left maxcols 2 font ', 44' width -1.5 spacing 1.3 maxrows 3

set xtics 5 offset 0, 0.3 
set ytics 10 offset 0.5, 0

set style line 7 lw 2

set style line 1 lt 1 lw 5 pt 7 ps 1.2 lc rgb "black"
set style line 2 lt 1 lw 5 pt 7 ps 1.2 lc rgb "grey"
#set style line 3 lt 1 lw 4 pt 7 ps 1.5 lc rgb "grey"
set style line 4 lt 1 lw 5 pt 7 ps 1.2 lc rgb "magenta"
set style line 5 lt 2 lw 4 pt 9 ps 2 lc rgb "blue"
set style line 6 lt 3 lw 4 pt 13 ps 2 lc rgb "green"

plot "harvard_merge_108.tsv"  \
    using ($1/2):(1000/$2) title 'baseline 2MB' w lp ls 1, \
''  using ($1/2):(1000/$4) title 'baseline 8MB' w lp ls 2, \
''  using ($1/2):(1000/$5) title 'baseline 16MB' w lp ls 4, \
''	using ($1/2):(1000/$8) title 'shrink only' w lp ls 5, \
''	using ($1/2):(1000/$9) title 'shrink + merge' w lp ls 6
#''  using 1:(1000/$4) title 'baseline 12m' w lp ls 3, \
