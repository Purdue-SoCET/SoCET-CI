# Install Guide: https://verilator.org/guide/latest/install.html

# Required Dependencies
# sudo apt-get install git perl python3 make
# sudo apt-get install g++  # Alternatively, clang
# sudo apt-get install libgz  # Non-Ubuntu (ignore if gives error)
# sudo apt-get install libfl2  # Ubuntu only (ignore if gives error)
# sudo apt-get install libfl-dev  # Ubuntu only (ignore if gives error)
# sudo apt-get install zlibc zlib1g zlib1g-dev  # Ubuntu only (ignore if gives error)

# Performance Optimization Dependencies
# sudo apt-get install ccache  # If present at build, needed for run
# sudo apt-get install libgoogle-perftools-dev numactl

# CLI Helper Dependencies 
# sudo apt-get install perl-doc

git clone https://github.com/verilator/verilator   # Only first time

cd verilator
git pull         # Make sure git repository is up-to-date
#git checkout master      # Use development branch
git checkout stable      # Use most recent stable release
#git checkout v{version}  # Switch to specified release version

autoconf         # Create ./configure script
unset VERILATOR_ROOT
./configure --prefix=/usr/bin      # Configure and create Makefile
make -j `nproc` # Build Verilator itself

cd ../
cp -r ./verilator/bin . # copy binary files
# make clean