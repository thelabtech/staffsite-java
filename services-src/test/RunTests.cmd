cd ..\source

set CLASSPATH=D:\ade\classes\;G:\Program Files\Together5.5\lib\gifs.zip;G:\Program Files\Together5.5\out\classes;G:\Program Files\Together5.5\lib\i18n;G:\Program Files\Together5.5\lib\jgl.zip;G:\Program Files\Together5.5\lib\jacl.jar;G:\Program Files\Together5.5\lib\coroutine;G:\Program Files\Together5.5\lib\xerces.jar;G:\Program Files\Together5.5\lib\jndi.jar;G:\Program Files\Together5.5\lib\tcljava.jar;G:\Program Files\Together5.5\lib\jcvs\jars\jcvsii.jar;G:\Program Files\Together5.5\lib\jcpagelayout.jar;G:\Program Files\Together5.5\lib\misclib.zip;G:\Program Files\Together5.5\lib\javax.jar;C:\Program Files\IBM\Java13\lib\tools.jar;G:\Program Files\Together5.5\lib\jhall.jar;G:\Program Files\Together5.5\help\together-help.jar;G:\Program Files\Together5.5\bundled\tomcat\lib\servlet.jar;G:\Program Files\Together5.5\lib\soap.jar;G:\Program Files\Together5.5\bundled\j2ee\lib\j2ee.jar;G:\Program Files\Together5.5\lib\tgscilib.jar;G:\Program Files\Together5.5\lib\openapi.jar;G:\Program Files\Together5.5\modules;D:\ade\classes;G:\Program Files\Together5.5\lib\junit\junit.jar;G:\Program Files\Together5.5\lib\junitx\junitx.jar;G:\Secant\lib\kjc.jar;G:\Secant\lib\tools.jar;G:\Secant\lib\xclient.jar;G:\Secant\lib\xschema.jar;G:\Secant\lib\xserver.jar;G:\Secant\lib\xtools.jar;D:\ade\auxclasses\mm.mysql-2.0.7-bin.jar;D:\ade\auxclasses\poolman.jar;;D:\ade\auxclasses\log4j.jar;D:\ade\auxclasses\oracle-jdbc.zip;D:\ade\auxclasses\castor-0.9.3.9.jar

java junit.textui.TestRunner org.alt60m.ministry.test.TestMinistryBrokerAdaptor 
java junit.textui.TestRunner org.alt60m.ministry.test.TestStaffAssociations	
java junit.textui.TestRunner org.alt60m.ministry.test.TestStatsInfo	
java junit.textui.TestRunner org.alt60m.ministry.proximity.test.TestProximityBroker	
java junit.textui.TestRunner org.alt60m.ministry.locator.test.TestLocatorBroker	
java junit.textui.TestRunner org.alt60m.hr.review360.test.TestReview360	
java junit.textui.TestRunner org.alt60m.groupware.discussion.test.TestDiscussionBroker	
java junit.textui.TestRunner org.alt60m.groupware.discussion.test.TestDiscussionManager	
java junit.textui.TestRunner org.alt60m.contentmgr.test.TestContentBroker	
java junit.textui.TestRunner org.alt60m.contentmgr.test.TestContentManager 

pause