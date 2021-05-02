package co.com.Reto5.stepdefinitions;


import co.com.Reto5.questions.TheReport;
import co.com.Reto5.tasks.ClicToReport;
import co.com.Reto5.tasks.EnterToEconomicActual;
import co.com.Reto5.tasks.EnterToSmartCapital;
import co.com.Reto5.tasks.Load;
import cucumber.api.java.Before;
import cucumber.api.java.es.Dado;
import cucumber.api.java.es.Cuando;
import cucumber.api.java.es.Entonces;
import net.serenitybdd.screenplay.GivenWhenThen;
import net.serenitybdd.screenplay.actors.OnlineCast;
import static net.serenitybdd.screenplay.actors.OnStage.*;


public class DescargarReporteStepDefinitions {

    @Before
    public void configuracionInicial(){
        setTheStage(new OnlineCast());
    }

    @Dado("^que Luis ingresa al portal Empresas - Capital Inteligente$")
    public void queLuisIngresaAlPortalEmpresasCapitalInteligente()  {
        theActorCalled("Luis").wasAbleTo(Load.theHome());
        theActorCalled("Luis").wasAbleTo(EnterToSmartCapital.page());
    }

    @Dado("^que Luis accede a la opción de Actualidad Economica y selecciona el reporte a descargar$")
    public void queLuisAccedeALaOpciónDeActualidadEconomicaYSeleccionaElReporteADescargar()  {
        theActorCalled("Luis").wasAbleTo(EnterToEconomicActual.page());
    }

    @Cuando("^Luis da clic a la imagen de descarga$")
    public void luisDaClicALaImagenDeDescarga()  {
        theActorCalled("Luis").wasAbleTo(ClicToReport.Download());
    }

    @Entonces("^Luis debería ver el reporte en una nueva ventana$")
    public void luisDeberíaVerElReporteEnUnaNuevaVentana()  {
        theActorCalled("Luis").should(GivenWhenThen.seeThat(TheReport.Downloaded()));
    }

}
