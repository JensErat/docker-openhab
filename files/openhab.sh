#!/usr/bin/env sh

# Workaround for OpenHAB #3487
#
# Delete stuck locks on serial ports. This is an unresolved OpenHAB issue
# with no solution in sight, and triggered often in Docker environments.
# https://github.com/openhab/openhab/issues/3487
rm -f /var/lock/LCK..*

# Start OpenHAB
exec java -Dosgi.clean=true -Declipse.ignoreApp=true -Dosgi.noShutdown=true -Djetty.port=8080 -Djetty.port.ssl=8443 -Djetty.home=. -Dlogback.configurationFile=configurations/logback.xml -Dfelix.fileinstall.dir=addons -Djava.library.path=lib -Djava.security.auth.login.config=./etc/login.conf -Dorg.quartz.properties=./etc/quartz.properties -Dequinox.ds.block_timeout=240000 -Dequinox.scr.waitTimeOnBlock=60000 -Dfelix.fileinstall.active.level=4 -Djava.awt.headless=true -jar ./server/plugins/org.eclipse.equinox.launcher_1.3.0.v20120522-1813.jar -console 5555
