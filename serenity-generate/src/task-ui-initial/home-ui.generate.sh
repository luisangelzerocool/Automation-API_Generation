#!/bin/bash
NAME_PROJECT=$1

HOME='
package co.com.'$NAME_PROJECT'.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl("https://www.miweb.com")
public class Home extends PageObject{

    public static final Target LINK = Target.the("Descripción del campo1")
            .located(By.id("miid"));
    public static final Target LABEL = Target.the("Descripción del campo2")
            .located(By.xpath("mixpath"));
}
'

echo "$HOME" > co.com.$NAME_PROJECT/src/main/java/co/com/$NAME_PROJECT/userinterface/Home.java