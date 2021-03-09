#!/bin/bash
NAME_PROJECT=$1
NAME_QUESTION=$2
NAME_USERINTERFACE=$3

QUESTION="
package co.com.$NAME_PROJECT.questions;

import co.com.$NAME_PROJECT.userinterface.$NAME_USERINTERFACE;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.questions.Text;

public class $NAME_QUESTION implements Question<String> {

    public static $NAME_QUESTION theMethodName (String theParamName) {
        return new $NAME_QUESTION();
    }

    @Override
    public String answeredBy(Actor actor) {
        return Text.of($NAME_USERINTERFACE.ELEMENT_OF_INTERFACE).viewedBy(actor).asString();
    }
}
"

echo "$QUESTION" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/questions/$NAME_QUESTION.java