#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

set terminal png size 600,400 enhanced font 'Helvetica Bold, 12' 
set output 'Fe0_vsm.png'
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
set y2range [-16.5:14.5]
set y2tics 
set y2label 'H (emu/cm3)'

plot  "Fe0_100.log" u 1:2 w linespoints  pointtype 1 lw 1 lc rgb 'red' title " Fe" axis x1y1 , "vsm.log" u 1:2 w linespoints pointtype 2 lw 1 lc rgb 'blue' title " VSM" axis x1y2
