#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 24,10  solid
set output "./eps/reserve_overhead.eps"
set size 1,0.9

set multiplot layout 1,2 title "Cauchy RS Reserve Overhead" 

set xtics font "Times-Roman, 36" 
set yrange [0:600]
set ytics font "Times-Roman, 46" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

set xlabel "Schemes (n,k)" offset 0, -0.7 font ', 46'
set ylabel "Avg. I/O per second (IOPS)" offset 1.4, 0 font ', 40'

#set key top left box lw 2 maxcols 3 maxrows 3 font ',40' width '0.5'
unset key

set xtics 1 offset -3.0, -2.6 rotate by 50
set ytics 100 offset 0.5, 0
#set grid ytics

set style line 7 lw 2

set style fill solid 1.0 border 7 
set boxwidth 0.7
set style data histogram
set style histogram clustered gap 1
set title "Rand. Write"

set rmargin 1
set bmargin 5.0
set lmargin 6.5
#set tmargin -2.0

plot "./tsv/reserve_overhead_randw.tsv" \
    u ($0):3:($2):xtic(1) w boxes lc rgb variable notitle
set title "Rand. Write"

set title "Recovery"
set ylabel "Agg. throughput (MB/s)" offset 1.4, 0 font ', 40'
plot "./tsv/reserve_overhead_recover.tsv" \
    u ($0):3:($2):xtic(1) w boxes lc rgb variable notitle

