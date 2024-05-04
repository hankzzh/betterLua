# !bin/bash --login

root_dir="sample"
LUA_CMD=lua

sample=()
pack=()
idx=0
function getdir(){
	deep=$2"* "
	packid=$3
	modname=`basename $1`
    for element in `ls $1`
    do  
		idx=$((idx+1))
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
			echo -e "${deep//*/|}\\ "
			echo -e "${deep//*/|} + $idx - $element"
			deep="${deep//*/|} "
            getdir $dir_or_file $deep $idx
        else
			echo -e "$deep $idx - " $element
			sample[$idx]=$dir_or_file
			if [ ! -n "$packid" ]; then
				this_pack=$pack[$packid]
				$this_pack[${#this_pack[@]}]=$dir_or_file
			fi
        fi  
    done
}
getdir $root_dir

function runcmd(){
	target=${sample[$1]}
	if test -z $target; then
		return
	fi
	echo -e "\n代码:$target-------\n"
	cat $target
	target=${target////.}
	target=`basename $target .lua`
	echo -e "\n结果:$target-------\n"
	$LUA_CMD -l "define" "main.lua" $target
}

while [ true ]
do
	if ! read  -t 3600 -p "Please enter your cmd: " cmd
	then
		echo "timeout"
		exit
	elif [ "$cmd" == 'q' -o "$cmd" == "Q" ]
	then
		echo "exit"
		exit
	elif [ "$cmd" == "" ]
	then
		for cmd in ${!sample[@]}
		do
			echo $cmd
			runcmd $cmd
		done
	else
		runcmd $cmd
	fi
done



