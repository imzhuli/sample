#!/bin/sh

make_spv()
{
	cd ${1}
	echo "${1}"
	for file in *[^\.spv]
	do
		glslangValidator -V "${file}"
	done
	cd - > /dev/null
}

cd assets/shaders
path=`pwd`

for file in *
do
	if [ -d ${file} ]
	then
		make_spv "${file}"
	fi
done
