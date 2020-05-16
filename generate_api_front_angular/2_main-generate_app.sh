#!/bin/bash
echo '******GENERANDO LOS COMPONENTES******'
_nombreProject='_API_Angular-Generated'


# INICIO bloque de código que crea los modelos en el server, partiendo de los archivos que haya en la carpeta models
modelosAppComponent=""
modelosAppRouting=""
modelosAppModuleImports=""
modelosAPPModuleDeclarations=""
modelosAPPModuleProvidersService=""
modelosAppRoutingImports=""
for modelo in `cd $_nombreProject/src/app/modelsUtil/ && find`; do #muestra . y muestra ./archivo.js
modeloConExt=`basename -s .txt "$modelo"` #Obtengo el nombre base del archivo.js me aparecerá sin ./archivo.js
nombreModeloSinExt="${modeloConExt%.*}" #obtengo archivo sin extensión
if [ "${nombreModeloSinExt}" != '' ];#como simpre lee un nombre . "vacio" entonces lo ovbio
then
nombreModeloMinus=$nombreModeloSinExt
nombreModeloMayus=`echo "${nombreModeloSinExt}" | sed 's/^./\u&/'` #convierto la primera letra en mayuscula

## construyo los fragmentos de código necesarios con el nombre de la entidad o modelo
modelosAppComponent=$modelosAppComponent"
			<li class=¬nav-item¬>
                <a routerLink=¬${nombreModeloMinus}/create¬ class=¬nav-link¬ routerLinkActive=¬active¬> Create ${nombreModeloMayus}</a>
            </li>
            <li class=¬nav-item¬>
                <a routerLink=¬${nombreModeloMinus}¬ class=¬nav-link¬ routerLinkActive=¬active¬> ${nombreModeloMayus} </a>
            </li>
"
modelosAppRoutingImports=$modelosAppRoutingImports"
import { ${nombreModeloMayus}AddComponent } from './${nombreModeloMinus}-add/${nombreModeloMinus}-add.component';
import { ${nombreModeloMayus}EditComponent } from './${nombreModeloMinus}-edit/${nombreModeloMinus}-edit.component';
import { ${nombreModeloMayus}GetComponent } from './${nombreModeloMinus}-get/${nombreModeloMinus}-get.component';
"
modelosAppRouting=$modelosAppRouting"
	{
        path: '${nombreModeloMinus}/create',
        component: ${nombreModeloMayus}AddComponent
    },
    {
        path: '${nombreModeloMinus}',
        component: ${nombreModeloMayus}GetComponent
    } ,
    {
        path: '${nombreModeloMinus}/edit/:id',
        component: ${nombreModeloMayus}EditComponent
    },
"
modelosAppModuleImports=$modelosAppModuleImports"
import { ${nombreModeloMayus}Service } from './${nombreModeloMinus}.service';
import { ${nombreModeloMayus}AddComponent } from './${nombreModeloMinus}-add/${nombreModeloMinus}-add.component';
import { ${nombreModeloMayus}GetComponent } from './${nombreModeloMinus}-get/${nombreModeloMinus}-get.component';
import { ${nombreModeloMayus}EditComponent } from './${nombreModeloMinus}-edit/${nombreModeloMinus}-edit.component';
"
modelosAPPModuleDeclarations=$modelosAPPModuleDeclarations"
    ${nombreModeloMayus}AddComponent,
    ${nombreModeloMayus}GetComponent,
    ${nombreModeloMayus}EditComponent,
"
modelosAPPModuleProvidersService=$modelosAPPModuleProvidersService"${nombreModeloMayus}Service,"



## obtengo los atributos del archivo modelo leido
_atributos=(`cat $_nombreProject/src/app/modelsUtil/$modelo`)
#construyo los fragmentos de código necesarios con los atributos
atribComoParamService=""
atribComoObjService=""
atribComoModel=""
atribComoAddForm=""
atribComoAddFormTS=""
atribComoEditForm=""
atribComogetFormEncabe=""
atribComogetFormCuerpo=""
atribParamComoAddForm=""
contEntradas=0
for i in "${_atributos[@]}"
do
# verifico si la entrada es la primera para que no ponga coma , al final
let contEntradas=contEntradas+1
if [ $contEntradas = 1 ]; then
atribComoParamService=$atribComoParamService"${i}"
atribComoObjService=$atribComoObjService"${i}:${i}"
atribParamComoAddForm=$atribParamComoAddForm"${i}.value"
atribComoAddFormTS=$atribComoAddFormTS"${i}: ['', Validators.required]"
else
atribComoParamService=$atribComoParamService",${i}"
atribComoObjService=$atribComoObjService",${i}:${i}"
atribParamComoAddForm=$atribParamComoAddForm",${i}.value"
atribComoAddFormTS=$atribComoAddFormTS",${i}: ['', Validators.required]"
fi

atribComoModel=$atribComoModel"${i}:String;"
atribComoAddForm=$atribComoAddForm"
			<div class=¬form-group¬>
                <label class=¬col-md-4¬>${i}</label>
                <input type=¬text¬ class=¬form-control¬ formControlName=¬${i}¬ #${i} />
            </div>
            <div *ngIf=¬${nombreModeloMinus}_addForm.controls['${i}'].invalid && (${nombreModeloMinus}_addForm.controls['${i}'].dirty || ${nombreModeloMinus}_addForm.controls['${i}'].touched)¬ class=¬alert alert-danger¬>
                <div *ngIf=¬${nombreModeloMinus}_addForm.controls['${i}'].errors.required¬>
                    Please Enter the ${i}
                </div>
            </div>
"
atribComoEditForm=$atribComoEditForm"
			<div class=¬form-group¬>
                <label class=¬col-md-4¬>${i}</label>
                <input type=¬text¬ class=¬form-control¬ formControlName=¬${i}¬ #${i} [(ngModel)]=¬${nombreModeloMinus}.${i}¬ />
            </div>
            <div *ngIf=¬${nombreModeloMinus}_editForm.controls['${i}'].invalid && (${nombreModeloMinus}_editForm.controls['${i}'].dirty || ${nombreModeloMinus}_editForm.controls['${i}'].touched)¬ class=¬alert alert-danger¬>
                <div *ngIf=¬${nombreModeloMinus}_editForm.controls['${i}'].errors.required¬>
                    ${i} is required.
                </div>
            </div>
"
atribComogetFormEncabe=$atribComogetFormEncabe"<td> ${i} </td>"
atribComogetFormCuerpo=$atribComogetFormCuerpo"<td>{{${nombreModeloMinus}.${i}}}</td>"
done


####### modelo.service.ts *************************************************************************************************
addRouteApi='`${this.uri}/add`'
findallRouteApi='`${this.uri}`'
findRouteApi='`${this.uri}/edit/${id}`'
updateRouteApi='`${this.uri}/update/${id}`'
deleteRouteApi='`${this.uri}/delete/${id}`'
modeloServiceTs="
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ${nombreModeloMayus}Service {

  uri = 'http://localhost:3000/${nombreModeloMinus}';


  constructor(private http: HttpClient) { }

  add${nombreModeloMayus}($atribComoParamService) {
    const obj = {
      
	  $atribComoObjService
	  
    };
    console.log(obj);
    this.http.post($addRouteApi, obj)
      .subscribe(res => console.log('Done'));
  }

  get${nombreModeloMayus}() {
    return this.http.get($findallRouteApi);
  }

  edit${nombreModeloMayus}(id) {
    return this.http.get($findRouteApi);
  }

  update${nombreModeloMayus}($atribComoParamService ,id) {
    const obj = {
      
	  $atribComoObjService
	  
    };
    this.http.post($updateRouteApi, obj)
      .subscribe(res => console.log('Done'));
  }

  delete${nombreModeloMayus}(id) {
    return this.http.get($deleteRouteApi);
  }
  
}
"
echo "$modeloServiceTs" > ./$_nombreProject/src/app/$nombreModeloMinus'.service.ts'
echo "${nombreModeloMinus}.service.ts generado correctamente!"


####### modelo_model.ts*************************************************************************************************
modelTs="
export default class ${nombreModeloMayus} {
	$atribComoModel
}
"
echo "$modelTs" > ./$_nombreProject/src/app/$nombreModeloSinExt'_model.ts'
echo "${nombreModeloSinExt}_model.ts generado correctamente!"

####### COMPONENTE modelo_add *************************************************************************************************
`mkdir ./$_nombreProject/src/app/$nombreModeloMinus'-add'`
addHTML="
<div class=¬card¬>
    <div class=¬card-body¬>
        <form [formGroup]=¬${nombreModeloMinus}_addForm¬ novalidate>

            $atribComoAddForm

          
            <div class=¬form-group¬>
                <button class=¬btn btn-primary¬ (click)=¬add${nombreModeloMayus}( $atribParamComoAddForm )¬ [disabled]=¬!${nombreModeloMinus}_addForm.valid || ${nombreModeloMinus}_addForm.pristine¬>Add ${nombreModeloMayus}</button>
            </div>
        </form>
    </div>
</div>
"
#1.creo un archcivo temporal con las comillas convertidas en ¬
echo "$addHTML" > ./$_nombreProject/src/app/tempFiles/$nombreModeloMinus'-add.component.html'
#2.remplazo en el archivo temporal html el ¬ por el "
`sed -i 's/¬/"/g' "./$_nombreProject/src/app/tempFiles/$nombreModeloMinus-add.component.html"`
`mv $_nombreProject/src/app/tempFiles/$nombreModeloMinus'-add.component.html' $_nombreProject/src/app/$nombreModeloMinus'-add'/`
echo "${nombreModeloMinus}-add.component.html generado correctamente!"


addTS="
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { ${nombreModeloMayus}Service } from '../${nombreModeloMinus}.service';

@Component({
  selector: 'app-${nombreModeloMinus}-add',
  templateUrl: './${nombreModeloMinus}-add.component.html',
  styleUrls: ['./${nombreModeloMinus}-add.component.css']
})
export class ${nombreModeloMayus}AddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  ${nombreModeloMinus}_addForm;
  constructor(private fb: FormBuilder , private bs: ${nombreModeloMayus}Service) {
    this.createForm();
  }

  createForm() {
    this.${nombreModeloMinus}_addForm = this.fb.group({
      
	  $atribComoAddFormTS
	  
    });
  }

  add${nombreModeloMayus} ($atribComoParamService) {
  this.bs.add${nombreModeloMayus}($atribComoParamService);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}
"
echo "__________GENERANDO COMPONENTE ${nombreModeloMinus}__________"
echo " " > ./$_nombreProject/src/app/$nombreModeloMinus'-add'/$nombreModeloMinus'-add.component.css'
echo "${nombreModeloMinus}-add.component.css generado correctamente!"
echo "$addTS" > ./$_nombreProject/src/app/$nombreModeloMinus'-add'/$nombreModeloMinus'-add.component.ts'
echo "${nombreModeloMinus}-add.component.ts generado correctamente!"


####### COMPONENTE modelo_edit *************************************************************************************************
`mkdir ./$_nombreProject/src/app/$nombreModeloMinus'-edit'`
editHTML="
<div class=¬card¬>
    <div class=¬card-body¬>
        <form [formGroup]=¬${nombreModeloMinus}_editForm¬ novalidate>
			
			
			$atribComoEditForm


            <div class=¬form-group¬>
                <button type=¬button¬ (click)=¬update${nombreModeloMayus}($atribParamComoAddForm)¬ [disabled]=¬${nombreModeloMinus}_editForm.invalid¬
                    class=¬btn btn-primary¬>Update ${nombreModeloMayus}</button>
            </div>
        </form>
    </div>
</div>


"
#1.creo un archcivo temporal con las comillas convertidas en ¬
echo "$editHTML" > ./$_nombreProject/src/app/tempFiles/$nombreModeloMinus'-edit.component.html'
#2.remplazo en el archivo temporal html el ¬ por el "
`sed -i 's/¬/"/g' "$_nombreProject/src/app/tempFiles/$nombreModeloMinus-edit.component.html"`
`mv $_nombreProject/src/app/tempFiles/$nombreModeloMinus'-edit.component.html' $_nombreProject/src/app/$nombreModeloMinus'-edit'/`
echo "${nombreModeloMinus}-edit.component.html generado correctamente!"

editTS="
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ${nombreModeloMayus}Service } from '../${nombreModeloMinus}.service';


@Component({
  selector: 'app-${nombreModeloMinus}-edit',
  templateUrl: './${nombreModeloMinus}-edit.component.html',
  styleUrls: ['./${nombreModeloMinus}-edit.component.css']
})


export class ${nombreModeloMayus}EditComponent implements OnInit {

  ${nombreModeloMinus}_editForm;
  ${nombreModeloMinus}: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: ${nombreModeloMayus}Service, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.${nombreModeloMinus}_editForm = this.fb.group({
      
	  $atribComoAddFormTS
	  
    });
  }

  update${nombreModeloMayus}($atribComoParamService) {
    this.route.params.subscribe(params => {
      this.ms.update${nombreModeloMayus}($atribComoParamService ,params['id']);
      this.router.navigate(['${nombreModeloMinus}']);
    });
  }


  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.edit${nombreModeloMayus}(params['id']).subscribe(res => {
        this.${nombreModeloMinus} = res;
      });
    });
  }
}
"
echo " " > ./$_nombreProject/src/app/$nombreModeloMinus'-edit'/$nombreModeloMinus'-edit.component.css'
echo "${nombreModeloMinus}-edit.component.css generado correctamente!"
echo "$editTS" > ./$_nombreProject/src/app/$nombreModeloMinus'-edit'/$nombreModeloMinus'-edit.component.ts'
echo "${nombreModeloMinus}-edit.component.ts generado correctamente!"


####### COMPONENTE modelo_get *************************************************************************************************
`mkdir ./$_nombreProject/src/app/$nombreModeloMinus'-get'`
parteConstante1="'[ /${nombreModeloMinus}/edit ,${nombreModeloMinus}._id]'"
getHTML="
<input class=¬form-control¬ type=¬text¬ name=¬search¬ placeholder=¬Search¬ [(ngModel)]=¬filter¬>
<br>
<table class=¬table table-bordered¬>
    <thead style=¬font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color:rgb(81, 81, 207)¬>
        <tr>
 
			$atribComogetFormEncabe
 
 
            <td>Edit</td>
            <td> Delete</td>
        </tr>
    </thead>
    <tbody>
        <tr *ngFor=¬let ${nombreModeloMinus} of ${nombreModeloMinus}  | filter:filter¬>
           

		   $atribComogetFormCuerpo
           
		   
            <td><a [routerLink]=¬['/${nombreModeloMinus}/edit',${nombreModeloMinus}._id]¬ class=¬btn btn-primary¬><i class=¬far fa-edit¬></i></a></td>
            <td><a (click)=¬delete${nombreModeloMayus}(${nombreModeloMinus}._id)¬ class=¬btn btn-danger¬><i class=¬far fa-trash-alt¬></i></a></td>
        </tr>
    </tbody>
</table>
<hr>
<button routerLink=¬/${nombreModeloMinus}/create¬ class=¬btn btn-primary¬><i class=¬fas fa-plus¬></i>Add new</button> &nbsp;
<button (click)=¬refresh()¬ class=¬btn btn-secondary¬><i class=¬fas fa-sync-alt¬></i></button>
"
#1.creo un archcivo temporal con las comillas convertidas en ¬
echo "$getHTML" > ./$_nombreProject/src/app/tempFiles/$nombreModeloMinus'-get.component.html'
#2.remplazo en el archivo temporal html el ¬ por el "
`sed -i 's/¬/"/g' "$_nombreProject/src/app/tempFiles/$nombreModeloMinus-get.component.html"`
`mv $_nombreProject/src/app/tempFiles/$nombreModeloMinus'-get.component.html' $_nombreProject/src/app/$nombreModeloMinus'-get'/`
echo "${nombreModeloMinus}-get.component.html generado correctamente!"

getTS="
import { Component, OnInit } from '@angular/core';
import { ${nombreModeloMayus}Service } from '../${nombreModeloMinus}.service';
import ${nombreModeloMayus} from '../${nombreModeloMinus}_model';

@Component({
  selector: 'app-${nombreModeloMinus}-get',
  templateUrl: './${nombreModeloMinus}-get.component.html',
  styleUrls: ['./${nombreModeloMinus}-get.component.css']
})
export class ${nombreModeloMayus}GetComponent implements OnInit {
  ${nombreModeloMinus}: ${nombreModeloMayus}[];
  constructor(private ms: ${nombreModeloMayus}Service) { }

  delete${nombreModeloMayus}(id) {
    this.ms.delete${nombreModeloMayus}(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.get${nombreModeloMayus}().subscribe((data: ${nombreModeloMayus}[]) => {
      this.${nombreModeloMinus} = data;
    });
  }

}
"
echo " " > ./$_nombreProject/src/app/$nombreModeloMinus'-get'/$nombreModeloMinus'-get.component.css'
echo "${nombreModeloMinus}-get.component.css generado correctamente!"
echo "$getTS" > ./$_nombreProject/src/app/$nombreModeloMinus'-get'/$nombreModeloMinus'-get.component.ts'
echo "${nombreModeloMinus}-get.component.ts generado correctamente!"



fi
done


####### COMPONENTE APP.COMPONENT  *************************************************************************************************
appComponentHTML="
<ng2-slim-loading-bar color=¬blue¬></ng2-slim-loading-bar>
<nav class=¬navbar navbar-expand-sm bg-light¬>
    <div class=¬container-fluid¬>
        <ul class=¬navbar-nav¬>
		
		
            $modelosAppComponent
			
			
        </ul>
    </div>
</nav>
<br>
<br>
<div class=¬container¬>
    <router-outlet></router-outlet>
</div>
"
#1.creo un archcivo temporal con las comillas convertidas en ¬
echo "$appComponentHTML" > ./$_nombreProject/src/app/tempFiles/app.component.html
#2.remplazo en el archivo temporal html el ¬ por el "
`sed -i 's/¬/"/g' "$_nombreProject/src/app/tempFiles/app.component.html"`
`mv $_nombreProject/src/app/tempFiles/app.component.html $_nombreProject/src/app/`
echo "app.component.html generado correctamente!"

appComponentTs="
import { Component } from '@angular/core';
import { SlimLoadingBarService } from 'ng2-slim-loading-bar';
import {
  NavigationCancel,
  NavigationEnd,
  NavigationError,
  NavigationStart,
  Event,
  Router
} from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = '${_nombreProject}';

/* Loading bar */

  constructor(private _loadingBar: SlimLoadingBarService, private _router: Router) {
    this._router.events.subscribe((event: Event) => {
      this.navigationInterceptor(event);
    });
  }
  private navigationInterceptor(event: Event): void {
    if (event instanceof NavigationStart) {
      this._loadingBar.start();
    }
    if (event instanceof NavigationEnd) {
      this._loadingBar.complete();
    }
    if (event instanceof NavigationCancel) {
      this._loadingBar.stop();
    }
    if (event instanceof NavigationError) {
      this._loadingBar.stop();
    }
  }
}
"
echo " " > ./$_nombreProject/src/app/app.component.css
echo "app.component.css generado correctamente!"
echo "$appComponentTs" > ./$_nombreProject/src/app/app.component.ts
echo 'app.component.ts generado correctamente!'



####### APP-ROUTING.MODULE  *************************************************************************************************
appRoutingModule="
import {NgModule} from '@angular/core';
import {Routes , RouterModule} from '@angular/router';


$modelosAppRoutingImports



const routes = [
    
	$modelosAppRouting
	
];

@NgModule({
    imports: [RouterModule.forRoot(routes)] ,
    exports: [RouterModule]
})

export class AppRoutingModule {
}
"
echo "$appRoutingModule" > ./$_nombreProject/src/app/app-routing.module.ts
echo "app-routing.module.ts generado correctamente!"

####### APP.MODULE.TS  *************************************************************************************************
appModule="
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

$modelosAppModuleImports


import { SlimLoadingBarModule } from 'ng2-slim-loading-bar';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

@NgModule({
  declarations: [
    AppComponent,
    
	$modelosAPPModuleDeclarations
	
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    AppRoutingModule,
    SlimLoadingBarModule,
    Ng2SearchPipeModule
  ],
  providers: [$modelosAPPModuleProvidersService],
  bootstrap: [AppComponent]
})
export class AppModule { }
"
echo "$appModule" > ./$_nombreProject/src/app/app.module.ts
echo "app.module.ts generado correctamente!"


#ELIMINO CARPETA TEMPORALES
`rm -rf ./$_nombreProject/src/app/modelsUtil`
`rm -rf ./$_nombreProject/src/app/tempFiles`
