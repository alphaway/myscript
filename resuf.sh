#!/bin/zsh
#author : litten
#description : 批量更改文件后缀名的脚本，需要传入3个参数
#参数1 : -d direction   文件夹的路径
#参数2 ：-o old_suffix  需要更改的文件的后缀名，如a.jpg的后缀名是jpg，那么参数是 -o jpg
#参数3 ：-n new_suffix  需要改成何种后缀名，如果需要将a.jpg 改名成a.png, 那么参数是 -n png
#注意： 该脚本具有递归性质

Usage="Usage resuf.sh [-d direction] [-o old_suffix] [-n new_suffix]"
opt_cnt=0
direction=""
old_suffix=""
new_suffix=""
while getopts d:o:n: option
do
	case $option in
		d)
			direction=$OPTARG 
			let opt_cnt++ ;;
		o)
			old_suffix=$OPTARG 
			let opt_cnt++ ;;
		n)
			new_suffix=$OPTARG 
			let opt_cnt++ ;;
		\?)
			exit 1;;
	esac
done
if [ $opt_cnt -eq 3 ]
then
	for file in `find $direction -name "*.$old_suffix"`
	do
		new_file_name=${file/%$old_suffix/$new_suffix}
		`mv $file $new_file_name`
		echo "rename $file ---> $new_file_name"
	done
else
	echo $Usage
fi
