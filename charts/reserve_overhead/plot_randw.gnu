#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,10 solid
set output "./eps/reserve_overhead_randw.eps"
set size 1,1

#set multiplot layout 1,2 title "Cauchy RS Reserve Overhead" 

set xtics font "Times-Roman, 45" 
set yrange [0:500]
set ytics font "Times-Roman, 45" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

set xlabel "Schemes (n,k)" offset 0, -1.5 font ', 48'
set ylabel "Avg. I/O per second (IOPS)" offset 1.4, -0.5 font ', 50'

#set key top left box lw 2 maxcols 3 maxrows 3 font ',40' width '0.5'
unset key

set xtics 1 offset -4.2, -3.4 rotate by 50
set ytics 100 offset 0.5, 0
#set grid ytics

set style line 7 lw 2

set style fill solid 1.0 border 7 
set boxwidth 0.7
set style data histogram
set style histogram clustered gap 1

set rmargin 1
set bmargin 6.0
set lmargin 6.5
#set tmargin -2.0

plot "./tsv/reserve_overhead_randw.tsv" \
    u ($0):3:($2):xtic(1) w boxes lc rgb variable notitle

#    using 3:xtic(1) title 'FO(8,6)' lc rgb "#000000", \
#''  using 4:xtic(1) title 'FL(8,6)' lc rgb "#6F6F6F", \
#''  using 5:xtic(1) title 'PL(8,6)' lc rgb "#E6E6E6", \
#''  using 6:xtic(1) title 'FO(8,4)' fill pattern 9, \
#''  using 7:xtic(1) title 'FL(8,4)' fill pattern 4, \
#''  using 8:xtic(1) title 'PL(8,4)' fill pattern 2, \
#''  using 2:xtic(1) title 'PLR' fill pattern 5
