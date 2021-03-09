#!/bin/bash
NAME_PROJECT=$1
NAME_USERINTERFACE=$2

USER_INTERFACE='
package co.com.'$NAME_PROJECT'.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;

public class '$NAME_USERINTERFACE' extends PageObject {

    public static final Target LINK = Target.the("Descripción del campo1")
            .located(By.id("miid"));
    public static final Target LABEL = Target.the("Descripción del campo2")
            .located(By.xpath("mixpath"));

}
'

echo "$USER_INTERFACE" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/userinterface/$NAME_USERINTERFACE.java