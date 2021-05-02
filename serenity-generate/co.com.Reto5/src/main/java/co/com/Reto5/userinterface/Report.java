
package co.com.Reto5.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;

public class Report extends PageObject {

    public static final Target DESCARGAR_INFORME_LABEL = Target.the("Etiqueta de descarga del informe")
            .located(By.xpath("//*[@id=\"main-content\"]/div[2]/div[1]/div/div[1]/p[10]/a"));

}

