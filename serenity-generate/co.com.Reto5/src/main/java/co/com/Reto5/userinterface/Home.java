
package co.com.Reto5.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl("https://www.grupobancolombia.com/")
public class Home extends PageObject{

    public static final Target EMPRESA_LABEL = Target.the("etiqueta de empresa")
            .located(By.id("header-empresas"));

}

