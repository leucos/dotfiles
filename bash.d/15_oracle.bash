export ORACLE_HOME=/usr/lib/oracle/11.2/client64/
export ORACLE_SID="TEST1020"
export LD_LIBRARY_PATH="$ORACLE_HOME/lib/"
export PATH=$PATH:$ORACLE_HOME/bin
export NLS_LANG=French_France.UTF8
export SQLPATH=$ORACLE_HOME/sqlplus
export PATH=$ORACLE_HOME/bin:$PATH

if [ $?LD_LIBRARY_PATH ]
then
  LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
else
  LD_LIBRARY_PATH=$ORACLE_HOME/lib
fi
export LD_LIBRARY_PATH

alias sqlplus='rlwrap sqlplus'

