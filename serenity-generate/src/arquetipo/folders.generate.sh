#!/bin/bash
NAME_PROJECT=$1

`rm -rf co.com.$NAME_PROJECT`

`mkdir co.com.$NAME_PROJECT`
`mkdir co.com.$NAME_PROJECT/src`
# main
`mkdir co.com.$NAME_PROJECT/src/main`
`mkdir co.com.$NAME_PROJECT/src/main/java`
`mkdir co.com.$NAME_PROJECT/src/main/java/co`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/exceptions`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/interactions`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/model`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/questions`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/tasks`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/userinterface`
`mkdir co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/util`
`mkdir co.com.$NAME_PROJECT/src/main/resources`
# test
`mkdir co.com.$NAME_PROJECT/src/test`
`mkdir co.com.$NAME_PROJECT/src/test/java`
`mkdir co.com.$NAME_PROJECT/src/test/java/co`
`mkdir co.com.$NAME_PROJECT/src/test/java/co/com`
`mkdir co.com.$NAME_PROJECT/src/test/java/co/com/$NAME_PROJECT`
`mkdir co.com.$NAME_PROJECT/src/test/java/co/com/$NAME_PROJECT/runners`
`mkdir co.com.$NAME_PROJECT/src/test/java/co/com/$NAME_PROJECT/stepdefinitions`
`mkdir co.com.$NAME_PROJECT/src/test/resources`
`mkdir co.com.$NAME_PROJECT/src/test/resources/driver`
`mkdir co.com.$NAME_PROJECT/src/test/resources/features`