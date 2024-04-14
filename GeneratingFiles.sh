# Parameter
INSTALL_APT=y #y or n

# Do not edit below
# Install apt package
if [ "$INSTALL_APT" = "y" ]; then
    echo "##################################"
    echo "### Install apt package....... ###"
    echo "##################################"
    echo ""
    sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev libusb-1.0-0-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev device-tree-compiler pkg-config python3
fi

echo ""
echo "###################################################"
echo "####### Please do not include Windows PATH. #######"
echo "###################################################"
echo ""

# Generate Bitstream
echo "#######################################"
echo "####### Generate Bitstream File #######"
echo "#######################################"
echo "Creating Bitstream of cva6......."
echo ""
git clone https://github.com/openhwgroup/cva6.git
cd ./cva6/
git submodule update --init --recursive
make fpga BOARD=nexys_video
cd ../

# Build Linux Images
echo ""
echo "#####################################"
echo "####### Building Linux Images #######"
echo "#####################################"
echo "Creating Linux Images for cva6......."
echo ""
git clone https://github.com/Saute0212/cva6-sdk.git
cd ./cva6-sdk/
git submodule update --init --recursive
make images
cd ../

# Copying generated files
mkdir Generated_Files
cd ./Generated_Files
wget https://github.com/openhwgroup/cva6-sdk/releases/download/v0.3.0-op/bbl.bin
chmod 777 ./bbl.bin
cp ../cva6/corev_apu/fpga/work-fpga/ariane_xilinx.bit ./
chmod 777 ./ariane_xilinx.bit
cp ../cva6/corev_apu/fpga/work-fpga/ariane_xilinx.mcs ./
chmod 777 ./ariane_xilinx.mcs
cp ../cva6-sdk/install64/uImage ./
chmod 777 ./uImage
echo ""
echo "#####################################################################"
echo "####### Finished Generating Bitstream File and Linux Images ! #######"
echo "#####################################################################"
