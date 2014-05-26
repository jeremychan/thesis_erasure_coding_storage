#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,8 solid
set output "./eps/recovery.eps"
set size 1,0.9

set xtics font "Times-Roman, 46" 
set yrange [0:500]
set ytics font "Times-Roman, 46" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

set xlabel "Number of OSDs" offset 0, 1 font ', 46'
set ylabel "Recovery throughput (MB/s)" offset 1.4, 0 font ', 44'

#set key top right box lw 2 maxcols 2 maxrows 3 font ',30' width '-0.8'
set key top left box lw 2 font ',40' width '0.6'

set xtics 1 offset 0.5, 0.4 
set ytics 100 offset 0.5, 0
#set grid ytics

set style line 7 lw 2

set style fill solid 1.0 border 7
set style data histogram
set style histogram clustered gap 1

set rmargin 1
set bmargin 1.5
set lmargin 5.5
set tmargin 0.5

plot "./tsv/recovery.tsv"  \
    using 4:xtic(1) title 'FO' lc rgb "black", \
''	using 2:xtic(1) title 'FL' lc rgb "#9F9F9F", \
''	using 3:xtic(1) title 'PL' lc rgb "#E6E6E6", \
''	using 5:xtic(1) title 'PLR' fill pattern 5 
