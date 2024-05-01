# !bin/bash --login

root_dir="sample"
LUA_CMD=lua

sample=()
headers=()
idx=0
function getdir(){
	deep=$2"* "
	modname=`basename $1`
    for element in `ls $1`
    do  
		idx=$((idx+1))
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
			echo -e "${deep//*/|}\\ "
			echo -e "${deep//*/|} + $idx - $element"
            getdir $dir_or_file "${deep//*/|} "
        else
			echo -e "$deep $idx - " $element
			sample[$idx]=$dir_or_file
        fi  
    done
}
getdir $root_dir

function runcmd(){
	target=${sample[$1]}
	if test -z $target; then
		return
	fi
	echo -e "\n代码:-------\n"
	cat $target
	target=${target////.}
	target=`basename $target .lua`
	echo -e "\n结果:-------\n"
	$LUA_CMD -l "define" "main.lua" $target
}

while [ true ]
do
	if ! read  -t 3600 -p "Please enter your cmd: " cmd
	then
		echo "timeout"
		exit
	elif [ "$cmd" == 'q' -o "$cmd" == "Q" -o "$cmd" == "" ]
	then
		echo "exit"
		exit
	# elif
	# 	sample=()
	# 	idx=0
	# 	#getdir $root_dir "*"
	# 	exit
	fi

	runcmd $cmd
done



