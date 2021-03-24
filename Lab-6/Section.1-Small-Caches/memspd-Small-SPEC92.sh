#!/bin/sh

../bin/memspd instruction-nasa7.dat 10 100 > speed-instruction-nasa7.dat
../bin/memspd data-nasa7.dat 10 100 > speed-data-nasa7.dat

../bin/memspd instruction-su2.dat 10 100 > speed-instruction-su2.dat
../bin/memspd data-su2.dat 10 100 > speed-data-su2.dat

../bin/memspd instruction-swm.dat 10 100 > speed-instruction-swm.dat
../bin/memspd data-swm.dat 10 100 > speed-data-swm.dat

../bin/memspd instruction-wave.dat 10 100 > speed-instruction-wave.dat
../bin/memspd data-wave.dat 10 100 > speed-data-wave.dat




