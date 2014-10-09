#~/.bashrc
#Part of bashrc to define user aliases


#User defined aliases
alias pmake="make -j 6"
alias ssh_cc="ssh -Y $CERTI_REMOTE_CC_IP -p2245"
alias ssh_tvqemu="ssh root@192.168.122.10"
alias mount_remote_fs="sshfs -p 2245 CERTI`echo '\\\\'`afb@${CERTI_REMOTE_CC_IP}:/home/likewise-open/CERTI/afb/Projects ${CERTI_PROJECT_PATH}"
alias so="source ${HOME}/.bash_profile"
alias cmake_clang="CXX=clang++ CC=clang cmake"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
alias maketags='mkdir -p $MAKEOBJDIRPREFIX/$(pwd -P) && gtags -i $MAKEOBJDIRPREFIX/$(pwd -P)'
alias maketags_cpp='GTAGSFORCECPP=1 $(maketags)'
alias gcc_cmake="CXX=g++-4.9 CC=gcc-4.9 cmake -G Ninja .."
alias gcc_ccmake="CXX=g++-4.9 CC=gcc-4.9 ccmake -G Ninja .."
alias android-cmake='cmake -DCMAKE_TOOLCHAIN_FILE=$ANDTOOLCHAIN'
#function mount_remote_fs {
  #sshfs -p 2245 CERTI`echo '\\\\'`afb@${CERTI_REMOTE_CC_IP}:/home/likewise-open/CERTI/afb/Projects ${CERTI_PROJECT_PATH}
#}

#Wine functions
function wine_build {
  WINEPREFIX=${WINE_BUILD_PREFIX} wine "$@"
}
function wine_msys {
  WINEPREFIX=${WINE_BUILD_PREFIX} wineconsole "C:\MinGW\msys\1.0\msys.bat"
}
