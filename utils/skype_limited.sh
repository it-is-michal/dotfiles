#/bin/bash
ulimit -v 512000
echo Memory limited up to `ulimit -v` KB.
echo Running Skype...
skype
echo Skype terminated.
echo Bye.

