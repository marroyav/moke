set term png
unset key
set xlabel "H (Oe)"
set ylabel "I (AU)"
set title "First Loop"
set output "one_loop.png"
plot "plot "<(sed -n '290,4000p' permalloy00.log)" using 0:2"