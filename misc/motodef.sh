/bin/bash -c "( perl -le 'print \"# This file was automatically generated from:\n#\t\" . join(\"\n#\t\", @ARGV) . \"\n\"' arch/arm/configs/msmcortex-perf_defconfig arch/arm/configs/ext_config/moto-msmcortex.config arch/arm/configs/ext_config/mot8937.config arch/arm/configs/ext_config/mot8937-hannah.config && cat arch/arm/configs/msmcortex-perf_defconfig arch/arm/configs/ext_config/moto-msmcortex.config arch/arm/configs/ext_config/mot8937.config arch/arm/configs/ext_config/mot8937-hannah.config ) > hannah_defconfig || ( rm -f hannah_defconfig && false )"
cp hannah_defconfig arch/arm/configs/hannah_defconfig