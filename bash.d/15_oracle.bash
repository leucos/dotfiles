export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/client
export ORACLE_SID="MAQ1020"
export LD_LIBRARY_PATH="$ORACLE_HOME/lib/"
export PATH=$PATH:$ORACLE_HOME/bin
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export SQLPATH=$ORACLE_HOME/sqlplus
export PATH=$ORACLE_HOME/bin:$PATH

if [ $?LD_LIBRARY_PATH ]
then
  LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
else
  LD_LIBRARY_PATH=$ORACLE_HOME/lib
fi
export LD_LIBRARY_PATH

