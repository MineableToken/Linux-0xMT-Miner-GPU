#!/usr/bin/env bash

command -v dotnet >/dev/null 2>&1 ||
{
 echo >&2 ".NET Core is not found or not installed,"
 echo >&2 "run 'sh install-deps.sh' to install dependencies.";
 read -p "Press any key to continue...";
 exit 1;
}
while : ; do
  if [ -f 0xMineableTokenMiner.conf ] ; then
    rm -f 0xMineableTokenMiner.conf
  fi
  dotnet 0xMineableTokenMiner.dll allowCPU=false allowIntel=true allowAMD=true allowCUDA=true web3api=https://arbitrum-one.public.blastapi.io abiFile=0xMT.abi contract=0xAe56c981F9bb8b07E380B209FcD1498c5876Fd4c gasToMine=0.1  gasApiMax=0.2 gasLimit=600000 gasApiURL= gasApiPath=$.safeLow gasApiMultiplier=0.1 gasApiOffset=1.0 privateKey=9f151c742cefc2d813551462c67c60cf9c6e55b6444fdc135ebb2f9d1bb19235
  [[ $? -eq 22 ]] || break
done
