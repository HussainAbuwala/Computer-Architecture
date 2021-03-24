#!/bin/sh

../bin/memspd instruction-awk.dat 10 100 > speed-instruction-awk.dat
../bin/memspd data-awk.dat 10 100 > speed-data-awk.dat

../bin/memspd instruction-sed.dat 10 100 > speed-instruction-sed.dat
../bin/memspd data-sed.dat 10 100 > speed-data-sed.dat

../bin/memspd instruction-tex.dat 10 100 > speed-instruction-tex.dat
../bin/memspd data-tex.dat 10 100 > speed-data-tex.dat

../bin/memspd instruction-yacc.dat 10 100 > speed-instruction-yacc.dat
../bin/memspd data-yacc.dat 10 100 > speed-data-yacc.dat




