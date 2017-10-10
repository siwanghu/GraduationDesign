#!/bin/bash

yes="y"
no="n"
clear
mpic++ Max.cpp -o Max
g++  -fopenmp Omp_Max.cpp -o Omp_Max
mpic++ -fopenmp -o Omp_MPI_Max Omp_MPI_Max.cpp
g++ Random.cpp -o Random
echo "...............需要产生数据吗?(y/n)................"
read console
clear
if [ $console == $yes ]
then
	echo "...............请输入产生的数据量大小!................"
	read number
	clear
	./Random $number
	echo ""
	echo "...............数据产生成功!................"
	echo ""
	echo "...............请输入进程个数!................"
	echo ""
	read process
	clear
	echo "...............请输入线程个数!................"
	echo ""
	read thread
	clear
	echo "...............程序开始运行!................"
	echo "MPI Program is running!"
	mpirun -np $process ./Max $number
	echo "openMP Program is running!"
	./Omp_Max $number $thread
	echo "openMP&MPI Program is running!"
	mpirun -np $process ./Omp_MPI_Max $number $thread
fi

if [ $console == $no ]
then
	echo "...............请输入数据量大小!................"
	echo ""
	read number
	clear
	echo "...............请输入进程个数!................"
	echo ""
	read process
	clear
	echo "...............请输入线程个数!................"
	echo ""
	read thread
	clear
	echo "程序开始运行!"
	echo "MPI Program is running!"
	mpirun -np $process ./Max $number
	echo "openMP Program is running!"
	./Omp_Max $number $thread
	echo "openMP&MPI Program is running!"
	mpirun -np $process ./Omp_MPI_Max $number $thread
fi































