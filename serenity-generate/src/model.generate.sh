#!/bin/bash
NAME_PROJECT=$1
NAME_MODEL=$2

MODEL="
package co.com.$NAME_PROJECT.model;

public class $NAME_MODEL {
    private String attribute;
 

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

}
"

echo "$MODEL" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/model/$NAME_MODEL.java