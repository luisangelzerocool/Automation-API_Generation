
package co.com.Reto5.tasks;

import co.com.Reto5.userinterface.SmartCapital;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;

public class EnterToEconomicActual implements Task {

    public EnterToEconomicActual() {
        super();
    }

    public static EnterToEconomicActual page() {
        return Tasks.instrumented(EnterToEconomicActual.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        actor.attemptsTo(

                Click.on(SmartCapital.ACTUALIDAD_ECONOMICA_LABEL),
                Click.on(SmartCapital.REPORTE_LABEL));

    }
}

