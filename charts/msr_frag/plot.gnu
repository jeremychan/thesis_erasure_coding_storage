#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,7 solid
set output "./eps/msr_frag.eps"
set size 1.4,0.9

set xtics font "Times-Roman, 45" 
set yrange [0:200]
set ytics font "Times-Roman, 38" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

#set xlabel "" offset 0, 0.8 font ', 39'
set ylabel "Avg. fragments per chunk" offset 2.1, 0 font ', 39'

#set key top left box lw 2 maxcols 2 maxrows 3 font ',30' width '-0.8'
set key top left box lw 2 maxcols 1 font ',32' samplen 3 spacing 1
#set key top right box lw 2 font ',30' 

set xtics ('src22' 0, 'mds0' 1, 'rsrch0' 2, 'usr0' 3, 'web0' 4, 'ts0' 5, 'stg0' 6, 'hm0' 7, 'prn1' 8, 'proj0' 9) offset 0.4, 0.4  font ', 30'
set ytics 25 offset 0.5, 0
#set grid ytics

set style line 7 lw 2

set style fill solid 1.0 border 7 
set style data histogram
set style histogram clustered gap 1

set bmargin 1.2
set rmargin 1 
set lmargin 5.5
set tmargin 0.5

plot "./tsv/msr_frag.tsv"  \
    using ($4)  title 'FL (Data)' lc rgb "black", \
''	using ($2)  title 'FL (Parity)' lc rgb "#9F9F9F", \
''	using ($3)  title 'PL (Data)' lc rgb "#E6E6E6", \
''	using ($5)  title 'PL (Parity)' fill pattern 5
