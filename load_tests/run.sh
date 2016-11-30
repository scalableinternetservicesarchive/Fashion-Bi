#/bin/bash
cd /home/ec2-user/.tsung/log
cd $( ls -1 | tail -1 )
tsung_stats.pl
echo "#####################"
echo "tsung load test succeeded, graphs created"
