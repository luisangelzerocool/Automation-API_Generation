
package co.com.Reto5.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;

public class SmartCapital extends PageObject {

    public static final Target ACTUALIDAD_ECONOMICA_LABEL = Target.the("Etiqueta de actualidad economica")
            .located(By.xpath("//*[@id=\"bs-example-navbar-collapse-1\"]/ul/li[2]/a"));
    public static final Target REPORTE_LABEL = Target.the("Etiqueta de reporte Evolución del contexto macroeconómico y global al inicio de 2021")
            .located(By.xpath("//*[@id=\"capital_inteligente\"]/div[1]/div[3]/div[2]/h2/a"));

}

