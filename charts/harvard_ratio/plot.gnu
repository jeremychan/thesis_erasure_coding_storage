#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,9 dl 3.5
set output "harvard_ratio.eps"
set size 1.7,0.9

set tmargin 0.5 
set bmargin 3
#set lmargin 7
set rmargin 0.5

set xlabel "Elasped time (day)" offset 0, 0.4 font ', 48'
set ylabel "Reserved space overhead" offset 0.8, 0 font ', 48'

set yrange [0:1.8]
set xrange [0.5:40.5]
set ytics 0.2 offset 0.6, 0 font 'Times-Roman, 46' format "%.1f"
set xtics 5 offset -0.3,0.3 font 'Times-Roman, 46'

set key at 40,1.2,0 right center box lw 2 reverse Left maxcols 2 font ', 44' width 0 spacing 1.3 maxrows 3

set style line 1 lt 1 lw 5 pt 7 ps 1.2 lc rgb "black"
set style line 2 lt 1 lw 5 pt 7 ps 1.2 lc rgb "grey"
#set style line 3 lt 1 lw 4 pt 7 ps 1.5 lc rgb "grey"
set style line 4 lt 1 lw 5 pt 7 ps 1.2 lc rgb "magenta"
set style line 5 lt 2 lw 4 pt 9 ps 2 lc rgb "blue"
set style line 6 lt 3 lw 4 pt 13 ps 2 lc rgb "green"

plot "harvard_ratio_108.tsv" using ($1/2):($2/100) title "baseline 2MB"  w lp ls 1, \
     "harvard_ratio_108.tsv" using ($1/2):($4/100) title "baseline 8MB"  w lp ls 2, \
     "harvard_ratio_108.tsv" using ($1/2):($5/100) title "baseline 16MB"  w lp ls 4, \
     "harvard_ratio_108.tsv" using ($1/2):($8/100) title "shrink only"  w lp ls 5, \
     "harvard_ratio_108.tsv" using ($1/2):($9/100) title "shrink + merge"  w lp ls 6
    # "harvard_ratio.tsv" using 1:($4/100) title "baseline 12m"  w lp ls 3, \
    # "harvard.tsv" using 1:($8/100) title "lower bound"  w lp ls 4
    # "harvard.tsv" using 1:($5) title "no deallocation" axes x1y2   w l ls 1, \
    #"harvard.tsv" using 1:($6) title "deallocation"  axes x1y2  w l ls 2, \
    #"harvard.tsv" using 1:($7) title "deallocation+merge" axes x1y2   w l ls 3
