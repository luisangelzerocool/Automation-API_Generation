#!/bin/bash
NAME_PROJECT=$1
NAME_TASK=$2
NAME_USERINTERFACE=$3

TASK="
package co.com.$NAME_PROJECT.tasks;

import co.com.$NAME_PROJECT.userinterface.$NAME_USERINTERFACE;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actions.Enter;

public class $NAME_TASK implements Task {

    private String strParam1;

    public $NAME_TASK(String strParam1) {
        super();
        this.strParam1 = strParam1;
    }

    public static $NAME_TASK elCodigo(String strParam1) {
        return Tasks.instrumented($NAME_TASK.class, strParam1);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        actor.attemptsTo(
                Enter.theValue(strParam1).into($NAME_USERINTERFACE.USER_FIELD),
                Click.on($NAME_USERINTERFACE.ENTER_BUTTON));

    }
}
"

echo "$TASK" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/tasks/$NAME_TASK.java