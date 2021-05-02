
package co.com.Reto5.questions;

import co.com.Reto5.userinterface.ReportDownloaded;
import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Question;
import net.serenitybdd.screenplay.questions.Text;

public class TheReport implements Question<Boolean> {

    public static TheReport Downloaded () {
        return new TheReport();
    }

    @Override
    public Boolean answeredBy(Actor actor) {
        String answer = Text.of(ReportDownloaded.CONTENIDO).viewedBy(actor).asString();
        return (answer != null);
    }
}

