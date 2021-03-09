#!/bin/bash
NAME_PROJECT=$1
NAME_UTIL=$2

UTIL="
package co.com.$NAME_PROJECT.util;

public class $NAME_UTIL {
    public static final int Zero = 0;
}
"

echo "$UTIL" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/util/$NAME_UTIL.java