#!/usr/bin/env python
 
import sys
import syslog
from email.parser import Parser
 
 
try:
    headers = Parser().parse(sys.stdin)
 
    syslog.syslog('Severity: %s' % headers['Severity'])
    syslog.syslog('Host: %s' % headers['Host'])
    syslog.syslog('Plugin: %s' % headers['Plugin'])
    syslog.syslog('Type: %s' % headers['Type'])
except Exception, e:
    syslog.syslog("got exception: %s" % str(e))
