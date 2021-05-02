
package co.com.Reto5.tasks;

import co.com.Reto5.userinterface.Report;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actions.Enter;

public class ClicToReport implements Task {

    public ClicToReport() {
        super();
    }

    public static ClicToReport Download() {
        return Tasks.instrumented(ClicToReport.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        actor.attemptsTo(

                Click.on(Report.DESCARGAR_INFORME_LABEL));

    }
}

