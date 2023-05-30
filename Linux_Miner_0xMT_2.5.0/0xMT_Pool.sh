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
  dotnet 0xMineableTokenMiner.dll abiFile=0xMT.abi contract=0xAe56c981F9bb8b07E380B209FcD1498c5876Fd4c web3api=https://arb-mainnet.g.alchemy.com/v2/dKEjBE4wIqKjLWur73EIvs8CqUH36oBw pool=http://abastoken.org:8080 address=0x9172ff7884CEFED19327aDaCe9C470eF1796105c
  [[ $? -eq 22 ]] || break
done
