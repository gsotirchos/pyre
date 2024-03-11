#!/bin/bash

prefix_dset="package://pyre/datasets"
prefix_db="package://pyre/database"
dataset=("shelf_zero" "shelf_height" "shelf_height_rot")   

for d in ${dataset[*]};
do 
    dset=$prefix_dset/$d/
    dbase=$prefix_db/$d/

    roslaunch --wait pyre process.launch dataset:=$dset database:=$dbase start:=1 end:=100 & 
    roslaunch --wait pyre process.launch dataset:=$dset database:=$dbase start:=101 end:=200 & 
    roslaunch --wait pyre process.launch dataset:=$dset database:=$dbase start:=201 end:=300 &
    roslaunch --wait pyre process.launch dataset:=$dset database:=$dbase start:=301 end:=400 &
    roslaunch --wait pyre process.launch dataset:=$dset database:=$dbase start:=401 end:=500 &
    wait
done
