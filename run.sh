# !bin/bash --login

root_dir="sample"
LUA_CMDS=()

for args in $*
do
	LUA_CMDS[${#LUA_CMDS[*]}]=$args
done
if [ ${#LUA_CMDS[*]} -le 0 ]; then
	LUA_CMDS[${#LUA_CMDS[*]}]=lua
fi
sample=()
declare -A pack
pack_id_count=()
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

			pack_id_count[$idx]=0
            getdir $dir_or_file $deep $idx
        else
			echo -e "$deep $idx - " $element
			sample[$idx]=$dir_or_file
			if [ $# -gt 1 ]; then
				packidx=${pack_id_count[$packid]}
				pack_id_count[$packid]=$((packidx+1))
				packname="pack_${packid}_${pack_id_count[$packid]}"
				pack[$packname]=$idx
			fi
        fi  
    done
}
getdir $root_dir

function runcmd(){
	if [ ! "${pack_id_count[$1]}" = "" ]; then
		for subidx in $(seq 1 ${pack_id_count[$1]}); do
			packname="pack_$1_${subidx}"
			runcmd ${pack[$packname]}
		done
		return
	fi

	target=${sample[$1]}
	if test -z $target; then
		return
	fi
	echo -e "\n代码:$target-------\n"
	cat $target
	target=${target////.}
	target=`basename $target .lua`
	echo -e "\n结果:$target----------\n"
	for LUA_CMD in ${LUA_CMDS[@]}
	do
		$LUA_CMD -v
		$LUA_CMD -l "define" "main.lua" $target
	done
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



