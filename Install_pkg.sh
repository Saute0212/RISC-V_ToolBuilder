# Parameters (y or n)
# <<<Packages(apt, apt-get) required to install the cross-compiler>>>
InstallPkg_RiscvGnuToolchain='y'
InstallPkg_RiscvNoneElfGccXpack='y'
InstallPkg_RiscvNoneElfGcc_CVA6='y'

# <<<Packages(apt, apt-get) required to install riscv-isa-sim>>>
InstallPkg_RiscvIsaSim='y'

# <<<Packages(apt, apt-get) required to install riscv-pk>>>
InstallPkg_RiscvPk='y'

# <<<Packages(apt, apt-get) required to install QEMU>>>
InstallPkg_Qemu='y'

# <<<Packages(apt, apt-get) required to install Vivado2018.2>>>
InstallPkg_Vivado2018='y'

# ------- Do not edit below -------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --InstallPkg_RiscvGnuToolchain=*)
      InstallPkg_RiscvGnuToolchain="${1#*=}"
      shift
      ;;
    --InstallPkg_RiscvNoneElfGccXpack=*)
      InstallPkg_RiscvNoneElfGccXpack="${1#*=}"
      shift
      ;;
    --InstallPkg_RiscvNoneElfGcc_CVA6=*)
      InstallPkg_RiscvNoneElfGcc_CVA6="${1#*=}"
      shift
      ;;
    --InstallPkg_RiscvIsaSim=*)
      InstallPkg_RiscvIsaSim="${1#*=}"
      shift
      ;;
    --InstallPkg_RiscvPk=*)
      InstallPkg_RiscvPk="${1#*=}"
      shift
      ;;
    --InstallPkg_Qemu=*)
      InstallPkg_Qemu="${1#*=}"
      shift
      ;;
    --InstallPkg_Vivado2018=*)
      InstallPkg_Vivado2018="${1#*=}"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Package(apt, apt-get) Updates
echo "Update the package(apt, apt-get)."
sudo apt update && sudo apt upgrade -y
sudo apt-get update && sudo apt upgrade -y

# Installation of optionally specified packages(apt, apt-get)
if [ "$InstallPkg_RiscvGnuToolchain" = "y" ]; then
  echo "Install the necessary packages with riscv-gnu-toolchain."
  sudo apt-get install -y autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev
fi

if [ "$InstallPkg_RiscvNoneElfGccXpack" = "y" ]; then
  echo "There are no packages that need to be installed."
fi

if [ "$InstallPkg_RiscvNoneElfGcc_CVA6" = "y" ]; then
  echo "Install the necessary packages with riscv-none-elf-gcc (used in CVA6)."
  sudo apt-get install -y autoconf automake autotools-dev curl git libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool bc zlib1g-dev
fi

if [ "$InstallPkg_RiscvIsaSim" = "y" ]; then
  echo "Install the necessary packages with riscv-isa-sim."
  sudo apt-get install -y device-tree-compiler libboost-regex-dev
fi

if [ "$InstallPkg_RiscvPk" = "y" ]; then
  echo "There are no packages that need to be installed."
fi

if [ "$InstallPkg_Qemu" = "y" ]; then
  echo "There are no packages that need to be installed."

fi

if [ "$InstallPkg_Vivado2018" = "y" ]; then
  echo "Install the necessary packages with Vivado 2018.2."
  sudo apt-get install -y libtinfo5 libtinfo-dev
fi

echo "Installation of the specified package has been completed!"
