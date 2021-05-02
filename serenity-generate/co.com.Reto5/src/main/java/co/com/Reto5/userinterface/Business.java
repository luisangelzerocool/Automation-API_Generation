
package co.com.Reto5.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;

public class Business extends PageObject {

    public static final Target CAPITAL_INTELIGENTE_LABEL = Target.the("Etiqueta de capital inteligente")
            .located(By.xpath("//*[@id=\"main-menu\"]/div[2]/ul[1]/li[4]/a"));

}

