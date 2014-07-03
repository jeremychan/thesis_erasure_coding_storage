#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,7 solid 
set output "./eps/msr_dist_1.eps"
set size 3,1

set xtics font "Times-Roman, 45" 
set yrange [0:100]
set ytics font "Times-Roman, 42" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

#set xlabel "Trace replayed" offset 1.4, 0.6 font ', 40'
set ylabel "Amount of updates (%)" offset 1.5, 0 font ', 48'

set key outside top center box lw 2 maxcols 5 maxrows 1 font ',45'
#set key top right box lw 2 font ',30' 

set xtics ('wdev3' 0, 'wdev1' 1, 'rsrch1' 2, 'src21' 3, 'web3' 4, 'hm1' 5, 'web2' 6, 'rsrch2' 7, 'web1' 8, 'proj4' 9, 'proj3' 10, 'mds1' 11, 'wdev2' 12, 'stg1' 13, 'src22' 14, 'wdev0' 15, 'mds0' 16, 'rsrch0' 17) rotate by 50 offset -1.2, -2.4  font ', 45'
set ytics 20 offset 0.5, 0
#set grid ytics

set style line 7 linewidth 2

set style fill solid 1.0 border 7
set style data histogram
set style histogram rows #gap 0.3 # rows

set boxwidth 0.55 
set tmargin 2.1
set rmargin 1.2
set bmargin 3.5
#set style histogram clustered gap 1

plot "./tsv/msr_dist_1.tsv"  \
    using 2 title '<4KB' lc rgb "black", \
''	using 3 title '4-16KB' lc rgb "#727272", \
''	using 4 title '16-128KB' lc rgb "#AFAFAF", \
''	using 5 title '128-512KB' lc rgb "#DFDFDF", \
''  using 6 title '>512KB' fill pattern 5
