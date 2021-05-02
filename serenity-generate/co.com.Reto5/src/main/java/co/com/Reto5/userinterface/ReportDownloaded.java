
package co.com.Reto5.userinterface;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.targets.Target;

public class ReportDownloaded extends PageObject {

    public static final Target CONTENIDO = Target.the("contenido del informe")
            .located(By.id("plugin"));

}

