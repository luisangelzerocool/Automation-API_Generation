
package co.com.Reto5.tasks;

import co.com.Reto5.userinterface.Home;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Open;

public class Load implements Task {

    private Home home;

    public static Load theHome() {
        return Tasks.instrumented(Load.class);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(Open.browserOn(home));
    }

}

