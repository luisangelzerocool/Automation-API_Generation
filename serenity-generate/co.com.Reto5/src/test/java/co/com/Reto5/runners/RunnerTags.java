
package co.com.Reto5.runners;


import cucumber.api.CucumberOptions;
import cucumber.api.SnippetType;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions (features = "src/test/resources/features/descargarreporte.feature",
				  tags = "@RunnerTags",
				  glue = "co.com.Reto5.stepdefinitions",
				  snippets = SnippetType.CAMELCASE )
				  
public class RunnerTags {

}

