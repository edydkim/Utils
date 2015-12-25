#!/bin/bash

PID_FILE=./this.pid

function catch {
    if [ x"$?" != "x0" ]; then
        exit 1
    fi
}

 Current Flags: ${JAVA_HOME}/bin/java -XX:+PrintFlagsFinal -version

# Whole Dumping Sequence:
# $> gcore or kill -3
# $> sort /tmp/gcore.log | uniq -c | sort -nr | less
# $> strings -a /tmp/gcore.log > /tmp/string.log


# Maven Deployment (no predefined main-classe with -jar)
# Argements: --outbound (-o) <queue name> in ("prop", "agen

# do or call something

catch
echo "$!" >> ${PID_FILE}

exit 0
