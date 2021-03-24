def copyFile(files,out1,out2):

    file1 = open(out1, 'w')
    file2 = open(out2, 'w')

    for item in files:

        f = open(item, 'r')

        words = f.readlines()
        for i, item in enumerate(words):
            words[i] = item.strip('\n')

        size = int(words[8].split(":")[1])
        instruction = float(words[18].split(":")[1])
        data = float(words[32].split(":")[1])

        file1.write(str(size) + "   " + str(instruction) + "\n")
        file2.write(str(size) + "   " + str(data) + "\n")



#files = ['nasa7-1024.txt','nasa7-2048.txt','nasa7-4096.txt','nasa7-8192.txt','nasa7-16384.txt','nasa7-32768.txt','nasa7-65536.txt']
#files2_unix = ['awk-1024.txt','awk-2048.txt','awk-4096.txt','awk-8192.txt','awk-16384.txt','awk-32768.txt','awk-65536.txt']
#file3_unix = ['sed-1024.txt','sed-2048.txt','sed-4096.txt','sed-8192.txt','sed-16384.txt','sed-32768.txt','sed-65536.txt']
#file4_unix = ['tex-1024.txt','tex-2048.txt','tex-4096.txt','tex-8192.txt','tex-16384.txt','tex-32768.txt','tex-65536.txt']
#file5_unix = ['yacc-1024.txt','yacc-2048.txt','yacc-4096.txt','yacc-8192.txt','yacc-16384.txt','yacc-32768.txt','yacc-65536.txt']
#copyFile(files2_unix,'instruction-awk.dat','data-awk.dat')
#copyFile(file3_unix,'instruction-sed.dat','data-sed.dat')
#copyFile(file4_unix,'instruction-tex.dat','data-tex.dat')
#copyFile(file5_unix,'instruction-yacc.dat','data-yacc.dat')

files2_SPEC92 = ['wave-131072.txt','wave-262144.txt','wave-524288.txt','wave-1048576.txt','wave-2097152.txt','wave-4194304.txt','wave-8388608.txt']
file3_SPEC92 = ['swm-131072.txt','swm-262144.txt','swm-524288.txt','swm-1048576.txt','swm-2097152.txt','swm-4194304.txt','swm-8388608.txt']
file4_SPEC92 = ['su2-131072.txt','su2-262144.txt','su2-524288.txt','su2-1048576.txt','su2-2097152.txt','su2-4194304.txt','su2-8388608.txt']
file5_SPEC92 = ['nasa7-131072.txt','nasa7-262144.txt','nasa7-524288.txt','nasa7-1048576.txt','nasa7-2097152.txt','nasa7-4194304.txt','nasa7-8388608.txt']
copyFile(files2_SPEC92,'instruction-wave.dat','data-wave.dat')
copyFile(file3_SPEC92,'instruction-swm.dat','data-swm.dat')
copyFile(file4_SPEC92,'instruction-su2.dat','data-su2.dat')
copyFile(file5_SPEC92,'instruction-nasa7.dat','data-nasa7.dat')

# 9 - cache size
# 19 - hit ratio (instruction)
# 33 - hit ration (data)
