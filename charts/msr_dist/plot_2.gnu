#!/usr/bin/gnuplot

set terminal postscript enhanced portrait 'Times-Roman' 36 size 10,7 solid 
set output "./eps/msr_dist_2.eps"
set size 3,1

set xtics font "Times-Roman, 45" 
set yrange [0:100]
set ytics font "Times-Roman, 42" 

#set tmargin 0.5
#set bmargin 2
#set lmargin 5
#set rmargin 0

#set xlabel "Trace replayed" offset 1.4, 0.6 font ', 40'
set ylabel "Amount of updates (%)" offset 1.5, 0 font ', 44'

#set key outside top center box lw 2 maxcols 5 maxrows 1 font ',28' width '-2.7'
#set key top right box lw 2 font ',30' 
unset key

set xtics ('usr0' 0, 'src20' 1, 'web0' 2, 'src12' 3, 'ts0' 4, 'stg0' 5, 'usr2' 6, 'src11' 7, 'proj1' 8, 'hm0' 9, 'prn1' 10, 'proj2' 11, 'proj0' 12, 'usr1' 13, 'prn0' 14, 'prxy0' 15, 'src10' 16, 'prxy1' 17) rotate by 50 offset -1.2, -2.0  font ', 40'
set ytics 20 offset 0.5, 0
#set grid ytics

set style line 7 linewidth 2

set style fill solid 1.0 border 7
set style data histogram
set style histogram rows #gap 0.3 # rows

set boxwidth 0.55 
set tmargin 1.6
set rmargin 1.2
set bmargin 3.0
#set style histogram clustered gap 1

plot "./tsv/msr_dist_2.tsv"  \
    using 2 title '<4KB' lc rgb "black", \
''	using 3 title '4-16KB' lc rgb "#727272", \
''	using 4 title '16-128KB' lc rgb "#AFAFAF", \
''	using 5 title '128-512KB' lc rgb "#DFDFDF", \
''  using 6 title '>512KB' fill pattern 5
