# Parameters (Repository URL or URL for download)
CloneURL_RiscvGnuToolchain='https://github.com/riscv-collab/riscv-gnu-toolchain.git'
CloneURL_RiscvNoneElfGccXpack='https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v13.2.0-2/xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz'
CloneURL_RiscvNoneElfGcc_CVA6='https://github.com/openhwgroup/cva6.git'
CloneURL_RiscvIsaSim='https://github.com/riscv-software-src/riscv-isa-sim.git'
CloneURL_RiscvPk='https://github.com/riscv-software-src/riscv-pk.git'
CloneURL_Qemu='https://github.com/qemu/qemu.git'
CloneURL_CVA6='https://github.com/openhwgroup/cva6.git'
CloneURL_CVA6SDK='https://github.com/openhwgroup/cva6-sdk.git'

# Parameters (y or n)
CloneRepo_RiscvGnuToolchain='y'
CloneRepo_RiscvNoneElfGccXpack='y'
CloneRepo_RiscvNoneElfGcc_CVA6='y'
CloneRepo_RiscvIsaSim='y'
CloneRepo_RiscvPk='y'
CloneRepo_Qemu='y'
CloneRepo_CVA6='y'
CloneRepo_CVA6SDK='y'

# ------- Do not edit below -------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --CloneURL_RiscvGnuToolchain=*)
      CloneURL_RiscvGnuToolchain="${1#*=}"
      shift
      ;;
    --CloneURL_RiscvNoneElfGccXpack=*)
      CloneURL_RiscvNoneElfGccXpack="${1#*=}"
      shift
      ;;
    --CloneURL_RiscvNoneElfGcc_CVA6=*)
      CloneURL_RiscvNoneElfGcc_CVA6="${1#*=}"
      shift
      ;;
    --CloneURL_RiscvIsaSim=*)
      CloneURL_RiscvIsaSim="${1#*=}"
      shift
      ;;
    --CloneURL_RiscvPk=*)
      CloneURL_RiscvPk="${1#*=}"
      shift
      ;;
    --CloneURL_Qemu=*)
      CloneURL_Qemu="${1#*=}"
      shift
      ;;
    --CloneURL_CVA6=*)
      CloneURL_CVA6="${1#*=}"
      shift
      ;;
    --CloneURL_CVA6SDK=*)
      CloneURL_CVA6SDK="${1#*=}"
      shift
      ;;
    --CloneRepo_RiscvGnuToolchain=*)
      CloneRepo_RiscvGnuToolchain="${1#*=}"
      shift
      ;;
    --CloneRepo_RiscvNoneElfGccXpack=*)
      CloneRepo_RiscvNoneElfGccXpack="${1#*=}"
      shift
      ;;
    --CloneRepo_RiscvNoneElfGcc_CVA6=*)
      CloneRepo_RiscvNoneElfGcc_CVA6="${1#*=}"
      shift
      ;;
    --CloneRepo_RiscvIsaSim=*)
      CloneRepo_RiscvIsaSim="${1#*=}"
      shift
      ;;
    --CloneRepo_RiscvPk=*)
      CloneRepo_RiscvPk="${1#*=}"
      shift
      ;;
    --CloneRepo_Qemu=*)
      CloneRepo_Qemu="${1#*=}"
      shift
      ;;
    --CloneRepo_CVA6=*)
      CloneRepo_CVA6="${1#*=}"
      shift
      ;;
    --CloneRepo_CVA6SDK=*)
      CloneRepo_CVA6SDK="${1#*=}"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Clone the repository specified by the option
mkdir BuildTool
mkdir GenerateData

if [ "$CloneRepo_RiscvGnuToolchain" = "y" ]; then
  cd ./BuildTool/
  git clone $CloneURL_RiscvGnuToolchain
  cd ../
fi

if [ "$CloneRepo_RiscvNoneElfGccXpack" = "y" ]; then
  cd ./BuildTool/
  wget $CloneURL_RiscvNoneElfGccXpack
  cd ../
fi

if [ "$CloneRepo_RiscvNoneElfGcc_CVA6" = "y" ]; then
  cd ./BuildTool/
  git clone $CloneURL_RiscvNoneElfGcc_CVA6
  cd ./cva6/
  git submodule update --init --recursive
  cd ../../
fi

if [ "$CloneRepo_RiscvIsaSim" = "y" ]; then
  cd ./BuildTool/
  git clone $CloneURL_RiscvIsaSim
  cd ../
fi

if [ "$CloneRepo_RiscvPk" = "y" ]; then
  cd ./BuildTool/
  git clone $CloneURL_RiscvPk
  cd ../
fi

if [ "$CloneRepo_Qemu" = "y" ]; then
  cd ./BuildTool/
  git clone $CloneURL_Qemu
  cd ../
fi

if [ "$CloneRepo_CVA6" = "y" ]; then
  cd ./GenerateData/
  git clone $CloneURL_CVA6
  cd ./cva6/
  git submodule update --init --recursive
  cd ../../
fi

if [ "$CloneRepo_CVA6SDK" = "y" ]; then
  cd ./GenerateData/
  git clone $CloneURL_CVA6SDK
  cd ./cva6-sdk/
  git submodule update --init --recursive
  cd ../../
fi

echo "The clone of the repository specified by the option has been completed!"
