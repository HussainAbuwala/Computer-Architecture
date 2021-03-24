#
# $Id: $
#
# Created 23/04/2000 C. Kopp
#
# ACS Cache Simulations Template Plot File
#
#
#
set samples 1000
set xtics
set ytics autofreq 0,5
set autoscale
set grid

###############################################################################
#
# spec92 cache behaviour
#
###############################################################################
set title " "
set title "R2000 Effective Access Time - SPEC92 Directly Mapped Large (Student John Doe ID######)"
set xlabel "Cache Size [bytes]"
set ylabel "Access Time [ns]"
set logscale x
set nologscale y

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

plot [:8388608][0:]   \
"speed-instruction-nasa7.dat" using 1:3:xtic(1) title "Inst Cache nasa7.pdt" ls 1,\
"speed-instruction-su2.dat" using 1:3 title "Inst Cache su2.pdt" ls 2,\
"speed-instruction-swm.dat" using 1:3 title "Inst Cache swm.pdt" ls 3,\
"speed-instruction-wave.dat" using 1:3 title "Inst Cache wave.pdt" ls 4,\
"speed-data-nasa7.dat" using 1:3 title "Data Cache nasa7.pdt" ls 5,\
"speed-data-su2.dat" using 1:3 title "Data Cache su2.pdt" ls 6,\
"speed-data-swm.dat" using 1:3 title "Data Cache swm.pdt" ls 7,\
"speed-data-wave.dat" using 1:3 title "Data Cache wave.pdt" ls 8

pause -1 "Hit return to continue"

set terminal postscript color
set output "speed-spec92-dm-big.ps"

replot

pause -1 "Hit return to continue"

set terminal pngcairo  notransparent enhanced font "arial,10" fontscale 1.0 size 750, 570 
set output "speed-spec92-dm-big.png"

replot
