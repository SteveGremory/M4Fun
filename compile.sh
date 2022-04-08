# C Libraries
C_CODE=$(m4 hello.m4 | sed -n "/ABC_STARTC_LIB/,/ABC_ENDC_LIB/p" | sed -e "s/ABC_STARTC_LIB//g" | sed -e "s/ABC_ENDC_LIB//g")
LIB_NAME=$(echo "${C_CODE}" | head -n 1 | sed -e "s/://g")

# Compile
$(echo "${C_CODE}" | sed '1d' | clang -xc -shared -o lib"${LIB_NAME}".so - -fpic)

# Compile C
#m4 hello.m4 | sed -n "/ABC_STARTC/,/ABC_ENDC/p" | sed -e "s/ABC_STARTC//g" | sed -e "s/ABC_ENDC//g" | gcc -xc -

#echo "Result of the C Compilation:"
#./a.out
#rm ./a.out

echo "Python interpretation:"
# Interpret Python
# m4 hello.m4 | sed -n "/ABC_STARTPY/,/ABC_ENDPY/p" | sed -e "s/ABC_STARTPY//g" | sed -e "s/ABC_ENDPY//g" | python
FINAL=$(m4 hello.m4 | sed -n '1,/ABC_STARTC_LIB/p;/ABC_ENDC_LIB/,$p'  | sed -e "s/ABC_STARTC_LIB//g" | sed -e "s/ABC_ENDC_LIB//g" | sed -e "s/:.*//g" | python)
echo "${FINAL}"

rm ./lib"${LIB_NAME}".so
