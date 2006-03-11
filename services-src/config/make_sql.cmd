set PATH=%PATH%;c:\ade3\jdk1.3.1\bin
set CASTOR_DOCLET_HOME=c:\ade3\devtools\castor-doclet-jar-0.3.3\castor-doclet
call c:\ade3\devtools\castor-doclet-jar-0.3.3\castor-doclet\ddl-doclet -f %1 %2

perl fix_ddl.pl %1 > %1.fixed