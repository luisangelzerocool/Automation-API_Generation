
package co.com.Reto5.tasks;

import co.com.Reto5.userinterface.Business;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;

public class EnterToSmartCapital implements Task {

    public EnterToSmartCapital() {
        super();
    }

    public static EnterToSmartCapital page() {
        return Tasks.instrumented(EnterToSmartCapital.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {

        actor.attemptsTo(
                Click.on(Business.CAPITAL_INTELIGENTE_LABEL));

    }
}

