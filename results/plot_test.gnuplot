set terminal pdf size 6.75in,7.5cm font "Times, 11"
set output 'plot.pdf'

set multiplot layout 3,3 columnsfirst

set style fill transparent solid 0.33 noborder
set border back
set macros

# Macros
NOXTICS = "set format x ''; unset xlabel"
NOYTICS = "unset ylabel"
YTICS = "set ylabel 'Return per episode'"
XTICS = "set format x '%1.1fK'"

#V0MARGIN = "set tmargin at screen 0.980; set bmargin at screen 0.555"
#V1MARGIN = "set tmargin at screen 0.555; set bmargin at screen 0.130"
V0MARGIN = "set tmargin at screen 0.950; set bmargin at screen 0.677"
V1MARGIN = "set tmargin at screen 0.677; set bmargin at screen 0.403"
V2MARGIN = "set tmargin at screen 0.403; set bmargin at screen 0.130"
H0MARGIN = "set lmargin at screen 0.060; set rmargin at screen 0.347"
H1MARGIN = "set lmargin at screen 0.387; set rmargin at screen 0.653"
H2MARGIN = "set lmargin at screen 0.693; set rmargin at screen 0.980"

# Algos

lunarlander_ppi = "<(python3 ../avg_stats.py 0 '' out-parallel-lunarlander-rp-8critics-er256-epochs20x8-qloops1-1)"
lunarlander_mimic = "<(python3 ../avg_stats.py 0 '' out-parallel-lunarlander-rp-8critics-er256-epochs20x8-qloops1-1)"




# LunarLander
set ytics ('-400' -400, '-200' -200, '0' 0, '200' 200)
@V0MARGIN; @H1MARGIN; @NOXTICS; @NOYTICS
set xlabel ""
set nokey
plot [0:1] [-560:300] \
    lunarlander_mimic using 1:3:4 with filledcu notitle lc rgb "#8888ff", lunarlander_mimic using 1:2 with lines title 'BDPI Actor-Mimic loss' lc "#000088" dt 5, \
    lunarlander_ppi using 1:3:4 with filledcu notitle lc rgb "#888888", lunarlander_ppi using 1:2 with lines title 'BDPI (ours)' lc "#000000"

