cd ~
mkdir 00Software
cd 00Software
wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz
tar zxvf llvm-3.2.src.tar.gz
mv llvm-3.2.src llvm-3.2
mkdir build
cd build
../llvm-3.2/configure --enable-optimized --prefix=/opt
REQUIRES_RTTI=1 make -j3
make check-all
sudo REQUIRES_RTTI=1 make install

