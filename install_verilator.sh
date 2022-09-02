git clone https://github.com/verilator/verilator   # Only first time

unset VERILATOR_ROOT
cd verilator
git pull         # Make sure git repository is up-to-date
# git tag          # See what versions exist
#git checkout master      # Use development branch
git checkout stable      # Use most recent stable release
#git checkout v{version}  # Switch to specified release version

autoconf         # Create ./configure script
./configure      # Configure and create Makefile
make  # Build Verilator itself
make install

rm -r /tmp/verilator # Clean up build