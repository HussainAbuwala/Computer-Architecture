#
# $Id: $
#
# Created 22/05/2018 Mark Dhruba Sikder
#
# ACS Cache Simulations Template Plot File
#
#
#
#set samples 1000
set xtics out nomirror
set ytics out nomirror autofreq 0.05
set autoscale
set grid
set border 3

###############################################################################
#
# utilities cache behaviour
#
###############################################################################
set title " "
set title "R2000 Cache Hit Ratios - Unix Utilities (Mark Sikder 26529548)"
set xlabel "Cache Size [bytes]"
set ylabel "Hit Ratio [-]"
set logscale x
set nologscale y

set key bottom

set terminal x11

set style data linespoints

set style line 1 lw 2 lt 1 lc rgb "#8a0000" pt 9 ps 1.5
set style line 2 lw 2 lt 1 lc rgb "#008a00" pt 11 ps 1.5
set style line 3 lw 2 lt 1 lc rgb "#00008a" pt 7 ps 1.5
set style line 4 lw 2 lt 1 lc rgb "#8a008a" pt 5 ps 1.5
set style line 5 lw 2 lt 2 lc rgb "#ff0000" pt 8 ps 1.5
set style line 6 lw 2 lt 2 lc rgb "#00ff00" pt 10 ps 1.5
set style line 7 lw 2 lt 2 lc rgb "#0000ff" pt 6 ps 1.5
set style line 8 lw 2 lt 2 lc rgb "#ff00ff" pt 4 ps 1.5

plot [1024:65536][0.5:1.0]   \
"instruction-awk.dat" using 1:2:xticlabels(1) title "Inst Cache awk.pdt" ls 1,\
"instruction-sed.dat" title "Inst Cache sed.pdt" ls 2,\
"instruction-tex.dat" title "Inst Cache tex.pdt" ls 3,\
"instruction-yacc.dat" title "Inst Cache yacc.pdt" ls 4,\
"data-awk.dat" title "Data Cache awk.pdt" ls 5,\
"data-sed.dat" title "Data Cache sed.pdt" ls 6,\
"data-tex.dat" title "Data Cache tex.pdt" ls 7,\
"data-yacc.dat" title "Data Cache yacc.pdt" ls 8

pause -1 "Hit return to continue"

set terminal postscript color 
set output "utilities.ps"

replot

pause -1 "Hit return to continue"

set terminal pngcairo  notransparent enhanced font "arial,10" fontscale 1.0 size 750, 570 
set output "utilities.png"

replot
