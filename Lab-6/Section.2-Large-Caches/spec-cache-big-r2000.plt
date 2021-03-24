#
# $Id: $
#
# Created 22/05/2018 Mark Dhruba Sikder
#
# ACS Cache Simulations Template Plot File
#
#
#
set samples 1000
set xtics
set ytics
set autoscale
set grid
set key bottom


###############################################################################
#
# spec92 cache behaviour
#
###############################################################################
set title " "
set title "R2000 Cache Hit Ratios - SPEC92 Directly Mapped Large (Mark Sikder 26529548)"
set xlabel "Cache Size [bytes]"
set ylabel "Hit Ratio [-]"
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

plot [131072:8388608][0.2:1.0]   \
"instruction-nasa7.dat" using 1:2:xticlabels(1) title "Inst Cache nasa7.pdt" ls 1,\
"instruction-su2.dat" title "Inst Cache su2.pdt" ls 2,\
"instruction-swm.dat" title "Inst Cache swm.pdt" ls 3,\
"instruction-wave.dat" title "Inst Cache wave.pdt" ls 4,\
"data-nasa7.dat" title "Data Cache nasa7.pdt" ls 5,\
"data-su2.dat" title "Data Cache su2.pdt" ls 6,\
"data-swm.dat" title "Data Cache swm.pdt" ls 7,\
"data-wave.dat" title "Data Cache wave.pdt" ls 8

pause -1 "Hit return to continue"

set terminal postscript color
set output "spec92-dm-big.ps"

replot

pause -1 "Hit return to continue"

set terminal pngcairo  notransparent enhanced font "arial,10" fontscale 1.0 size 750, 570 
set output "spec92-dm-big.png"

replot
