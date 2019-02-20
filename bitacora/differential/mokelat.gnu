#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

set terminal epslatex
set output 
set grid xtics ytics ls 3 lw 1 lc rgb 'gray'
set xlabel 'H(Oe)'
set ylabel 'I(A.U.)'
set xrange [-150:150]
set yrange [-1.1:1.1]
plot  "Fe8_100.log" u 1:2 with lines t 'Fe'
plot "Fe8_100.log" u 1:2 w lines ls 2 title " 8%"
plot "vsmvsmoke.log" u 1:2 w lines ls 2 title " 8%"
