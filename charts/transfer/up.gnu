#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,10 dl 5
set output "./eps/up/".NAME.".eps"
set size 1,1

set xrange [5.5:10.5]
set xtics font "Times-Roman, 45" 
set yrange [0:550]
set ytics font "Times-Roman, 45" 

set tmargin 0.5
set bmargin 2.6
set lmargin 7.5
set rmargin 0

set xlabel "Number of OSDs" offset 0, 0.5 font ', 55'
set ylabel "Agg. throughput (MB/s)" offset 0.5, 0 font ', 55'

set key at 10.4,270 box lw 3 maxcols 1 maxrows 5 font ', 55' width 1 samplen 7 spacing 1.6

set xtics 1 offset 0, 0.2 font ', 55'
set ytics 100 offset 0.5, 0 font ', 55'
set grid ytics

#
# define line styles using explicit rgbcolor names
#
set style line 1 lt 1 lw 9 pt 71 ps 3 lc rgb "blue"
set style line 2 lt 2 lw 9 pt 72 ps 3 lc rgb "red"
set style line 3 lt 3 lw 9 pt 73 ps 3 lc rgb "sea-green"
set style line 4 lt 4 lw 9 pt 74 ps 3 lc rgb "magenta"
set style line 5 lt 5 lw 9 pt 70 ps 3 lc rgb "black"

#
# draw some plots
#
plot "./tsv/up/".NAME.".tsv" \
	using 1:($2):xtic(1) w lp ls 1 title '8MB', \
''	using 1:($3):xtic(1) w lp ls 2 title '16MB', \
''	using 1:($4):xtic(1) w lp ls 3 title '32MB', \
''	using 1:($5):xtic(1) w lp ls 4 title '64MB', \
''	using 1:($6):xtic(1) w lp ls 5 title 'Theoretical'
