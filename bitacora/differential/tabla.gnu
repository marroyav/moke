#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

set terminal png size 300,300 enhanced font 'Helvetica Bold, 10' 
set output 'tabla.png'
set style line 2  lc rgb '#ff0000' lt 1 lw 2
set style line 3  lc rgb '#4286f4' lt 1 lw 2
set style line 4  lc rgb '#6ef441' lt 1 lw 2
set key right top Right  box 3
set mxtics 5
set mytics 5
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102
set xlabel '% C '
set ylabel 'Hc (Oe)' offset 1,0
set xrange [-2:10]
set yrange [0:35]

plot 'tabla.log' u 1:2 w p pt 7  lc 4 t 'VSM',\
	 'tabla.log' u 1:3 w p pt 7  lc 3 t 'Moke P',\
	 'tabla.log' u 1:4 w p pt 7  lc 1 t 'Moke M'