#!/bin/bash
NAME_PROJECT=$1

# build.gradle
BUILD_GRADLE="
tasks.withType(JavaCompile) {
    options.encoding = 'UTF-8'
}

repositories {
    mavenLocal()
    jcenter()
}

buildscript {
    repositories {
        mavenLocal()
        jcenter()
    }
    dependencies {
        classpath('net.serenity-bdd:serenity-gradle-plugin:1.9.45')     
    }
}

apply plugin: 'java'
apply plugin: 'eclipse'
apply plugin: 'idea'
apply plugin: 'net.serenity-bdd.aggregator' 

test {	
 	useJUnit {							
		include '**/RunnerTags.class';
 		//Sigue ejecutando aunque falle un caso
		gradle.startParameter.continueOnFailure = true
		//      
		testLogging.showStandardStreams = true
		systemProperties System.getProperties()	   	 	
	}
  
   //Loggin test
    testLogging {
        showStandardStreams = true
    }
    outputs.upToDateWhen { false }
    systemProperties 'property': 'value'   
}                            

dependencies {
	testCompile 'net.serenity-bdd:serenity-core:1.9.9'                  
    testCompile 'net.serenity-bdd:serenity-junit:1.1.1'                
    testCompile('junit:junit:4.12')
    testCompile('org.assertj:assertj-core:1.7.0')
    testCompile('org.slf4j:slf4j-simple:1.7.7')
    
    compile 'net.serenity-bdd:serenity-core:1.9.9'
    compile 'net.serenity-bdd:serenity-junit:1.9.9'
    compile 'net.serenity-bdd:serenity-cucumber:1.9.5'
}
gradle.startParameter.continueOnFailure = true 
"


# serenity.properties 
SERENITY_PROPERTIES="
webdriver.driver=chrome
webdriver.chrome.driver=src/test/resources/driver/chromedriver.exe
webdriver.firefox.driver=src/test/resources/driver/geckodriver.exe
webdriver.ie.driver=src/test/resources/driver/IEDriverServer.exe
# Appears at the top of the reports
serenity.project.name = Demo Project using Serenity and Cucumber

chrome.switches=--start-maximized

webdriver.timeouts.implicitlywait = 10000
serenity.take.screenshots=AFTER_EACH_STEP

serenity.verbose.steps=FALSE
serenity.report.encoding=UTF8
feature.file.encoding =UTF8

serenity.test.root=net.thucydides.showcase.cucumber.junit



# Root package for any JUnit acceptance tests
#serenity.test.root=net.thucydides.showcase.junit.features

# Customise your riequirements hierarchy
#serenity.requirement.types=feature, story

# Run the tests without calling webdriver - useful to check your Cucumber wireing
#serenity.dry.run=true

# Customise browser size
#serenity.browser.height = 1200
#serenity.browser.width = 1200
"


# settings.gradle
SETTINGS_GRADLE="
rootProject.name = 'co.com.$NAME_PROJECT'
"


# RunnerTags.java
RUNNER_TAGS='
package co.com.'$NAME_PROJECT'.runners;


import cucumber.api.CucumberOptions;
import cucumber.api.SnippetType;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions (features = "src/test/resources/features/demo.feature",
				  tags = "@RunnerTags",
				  glue = "co.com.'$NAME_PROJECT'.stepdefinitions",
				  snippets = SnippetType.CAMELCASE )
				  
public class RunnerTags {

}
'

# .gitignore
GITIGNORE="
# Eclipse
.classpath
.project
.settings/

# Intellij
.idea/
.gradle/
*.iml
*.iws
*.editorconfig

# Gradle
log/
target/
hooks/pre-push

# Java
build/
out/
*.class
*.jar
*.war
*.ear

# Log file
*.log
.scannerwork/report-task.txt
.scannerwork/.sonar_lock
.scannerwork/

# virtual machine crash logs
hs_err_pid*
.gradle
build/

# Ignore Gradle GUI config
gradle-app.setting

# Avoid ignoring Gradle wrapper jar file
!gradle-wrapper.jar

# Cache of project
.gradletasknamecache
"

echo "$BUILD_GRADLE" > co.com.$NAME_PROJECT/build.gradle
echo "$SERENITY_PROPERTIES" > co.com.$NAME_PROJECT/serenity.properties
echo "$SETTINGS_GRADLE" > co.com.$NAME_PROJECT/settings.gradle
echo "$GITIGNORE" > co.com.$NAME_PROJECT/.gitignore
echo "$RUNNER_TAGS" > co.com.$NAME_PROJECT/src/test/java/co/com/$NAME_PROJECT/runners/RunnerTags.java


