#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

set terminal png size 400,400 enhanced font 'Helvetica Bold, 12' 
set output 'Fe8_100.png'
set style line 2  lc rgb '#ff0000' lt 1 lw 3
set key left top Left  box 3
set mxtics 5
set mytics 5
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102
set xlabel 'H (Oe)'
set ylabel 'I (A.U.)' offset 1,0
set xrange [-150:150]
set yrange [-1.2:1.2]
plot  "Fe8_100.log" u 1:2 w lines ls 2 title " 8%"

set terminal png size 400,400 enhanced font 'Helvetica Bold, 12' 
set output 'vsmvsmoke.png'						
set style line 2  lc rgb '#ff0000' lt 1 lw 3
set key left top Left  box 3
set mxtics 5
set mytics 5
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102
set xlabel 'H (Oe)'
set ylabel 'M (emu/cm3)' offset 1,0
set xrange [-150:150]
set yrange [-0.00000025:0.00000025]
set datafile separator ","
plot for [n=2:2] 'Hys_Juan.csv' u 1:(column(n)/.16*40*(10**-6)) w lines ls 2 title " VSM"