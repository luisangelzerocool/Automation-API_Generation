#!/bin/bash
echo '******GENERANDO LOS COMPONENTES******'
_nombreProject='_API_Angular-Generated'

`mkdir ./$_nombreProject/src/app/models`

# INICIO bloque de código que crea los modelos en el server, partiendo de los archivos que haya en la carpeta models
modelosAppComponent=""
modelosAppRouting=""
modelosAppModuleImports=""
modelosAPPModuleDeclarations=""
modelosAPPModuleProvidersService=""
for modelo in `cd $_nombreProject/src/app/modelsUtil/ && find`; do #muestra . y muestra ./archivo.js
modeloConExt=`basename -s .txt "$modelo"` #Obtengo el nombre base del archivo.js me aparecerá sin ./archivo.js
modeloSinExt="${modeloConExt%.*}" #obtengo archivo sin extensión
if [ "${modeloSinExt}" != '' ];#como simpre lee un nombre . "vacio" entonces lo ovbio
then

## construyo los fragmentos de código necesarios con el nombre de la entidad o modelo
modelosAppComponent=$modelosAppComponent"
			<li class='nav-item'>
                <a routerLink='${modeloSinExt}/create' class='nav-link' routerLinkActive='active'> Create ${modeloSinExt}</a>
            </li>
            <li class='nav-item'>
                <a routerLink='${modeloSinExt}' class='nav-link' routerLinkActive='active'> ${modeloSinExt} </a>
            </li>
"
modelosAppRouting=$modelosAppRouting"
	{
        path: '${modeloSinExt}/add',
        component: ${modeloSinExt}AddComponent
    },
    {
        path: '${modeloSinExt}/findall',
        component: ${modeloSinExt}GetComponent
    } ,
    {
        path: '${modeloSinExt}/update/:id',
        component: ${modeloSinExt}UpdateComponent,
    },
"
modelosAppModuleImports=$modelosAppModuleImports"
import { ${modeloSinExt}Service } from './${modeloSinExt}-services/${modeloSinExt}.service';
import { ${modeloSinExt}AddComponent } from './${modeloSinExt}-add/${modeloSinExt}-add.component';
import { ${modeloSinExt}GetComponent } from './${modeloSinExt}-get/${modeloSinExt}-get.component';
import { ${modeloSinExt}UpdateComponent } from './${modeloSinExt}-update/${modeloSinExt}-update.component';
"

modelosAPPModuleDeclarations=$modelosAPPModuleDeclarations"
${modeloSinExt}AddComponent,
${modeloSinExt}GetComponent,
${modeloSinExt}UpdateComponent
"

modelosAPPModuleProvidersService=$modelosAPPModuleProvidersService"${modeloSinExt}Service,"

## obtengo los atributos del archivo modelo leido
_atributos=(`cat $_nombreProject/src/app/modelsUtil/$modelo`)
#construyo los fragmentos de código necesarios con los atributos
atribComoParamService=""
atribComoObjService=""
atribComoModel=""
atribComoAddForm=""
atribComoAddFormTS=""
atribComoUpdateForm=""
atribComogetFormEncabe=""
atribComogetFormCuerpo=""
for i in "${_atributos[@]}"
do
atribComoParamService=$atribComoParamService"${i},"
atribComoObjService=$atribComoObjService"${i}:${i},"
atribComoModel=$atribComoModel"${i}:String;"
atribComoAddForm=$atribComoAddForm"
			<div class='form-group'>
                <label class='col-md-4'>${i}</label>
                <input type='text' class='form-control' formControlName='${i}' #${i} />
            </div>
            <div *ngIf='${modeloSinExt}_addForm.controls["${i}"].invalid && (${modeloSinExt}_addForm.controls["${i}"].dirty || ${modeloSinExt}_addForm.controls["${i}"].touched)' class='alert alert-danger'>
                <div *ngIf='${modeloSinExt}_addForm.controls["${i}"].errors.required'>
                    Please Enter the ${i}
                </div>
            </div>
"
atribComoAddFormTS=$atribComoAddFormTS"${i}: ['', Validators.required],"

atribComoUpdateForm=$atribComoUpdateForm"<div class='form-group'>
                <label class='col-md-4'>${i}</label>
                <input type='text' class='form-control' formControlName='${i}' #${i} [(ngModel)]='${modeloSinExt}.${i}' />
            </div>
            <div *ngIf='${modeloSinExt}_updateForm.controls["${i}"].invalid && (${modeloSinExt}_updateForm.controls["${i}"].dirty || ${modeloSinExt}_updateForm.controls["${i}"].touched)' class='alert alert-danger'>
                <div *ngIf='${modeloSinExt}_updateForm.controls["${i}"].errors.required'>
                    ${i} is required.
                </div>
            </div>
"

atribComogetFormEncabe=$atribComogetFormEncabe"<td> ${i} </td>"
atribComogetFormCuerpo=$atribComogetFormCuerpo"<td>{{${modeloSinExt}.${i}}}</td>"

done








####### Modelo.service.ts*************************************************************************************************
addRouteApi='`${this.uri}/add`'
findallRouteApi='`${this.uri}/findall`'
findRouteApi='`${this.uri}/find/${id}`'
updateRouteApi='`${this.uri}/update/${id}`'
deleteRouteApi='`${this.uri}/delete/${id}`'

modeloServiceTs="
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ${modeloSinExt}Service {

  uri = 'http://localhost:3000/${modeloSinExt}';


  constructor(private http: HttpClient) { }

  add_${modeloSinExt}($atribComoParamService) {
    const obj = {
      
	  $atribComoObjService
	  
    };
    console.log(obj);
    this.http.post($addRouteApi, obj)
      .subscribe(res => console.log('Done'));
  }

  get_${modeloSinExt}() {
    return this.http.get($findallRouteApi);
  }

  find_${modeloSinExt}(id) {
    return this.http.get($findRouteApi);
  }

  update_${modeloSinExt}($atribComoParamService id) {
    const obj = {
      
	  $atribComoObjService
	  
    };
    this.http.post($updateRouteApi, obj)
      .subscribe(res => console.log('Done'));
  }

  delete_${modeloSinExt}(id) {
    return this.http.get($deleteRouteApi);
  }
}
"
`mkdir ./$_nombreProject/src/app/$modeloSinExt'-services'`
echo "$modeloServiceTs" > ./$_nombreProject/src/app/$modeloSinExt'-services'/$modeloSinExt'.service.ts'
echo "${modeloSinExt}.service.ts generado correctamente!"


####### modelo_model.ts*************************************************************************************************
modelTs="
export default class ${modeloSinExt} {
    
	$atribComoModel

}
"
echo "$modelTs" > ./$_nombreProject/src/app/models/$modeloSinExt'_model.ts'
echo "${modeloSinExt}_model.ts generado correctamente!"



####### COMPONENTE modelo_add*************************************************************************************************
`mkdir ./$_nombreProject/src/app/$modeloSinExt'-add'`
addHTML="
<div class='card'>
    <div class='card-body'>
        <form [formGroup]='${modeloSinExt}_addForm' novalidate>

			$atribComoAddForm

            <div class='form-group'>
                <button class='btn btn-primary' (click)='add_${modeloSinExt}(serial.value,brand.value,model.value,ubication.value,price_shopping.value,receipt_shopping.value,creation_date.value,sale_date.value,seller_identification.value,state.value)' [disabled]='!${modeloSinExt}_addForm.valid || ${modeloSinExt}_addForm.pristine'>Add ${modeloSinExt}</button>
            </div>
        </form>
    </div>
</div>
<p *ngIf='dataadded' class='alert alert-success'>{{ msg }}</p>
"

addTS="
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { ${modeloSinExt}Service } from '../${modeloSinExt}-services/${modeloSinExt}.service';

@Component({
  selector: 'app-${modeloSinExt}-add',
  templateUrl: './${modeloSinExt}-add.component.html',
  styleUrls: ['./${modeloSinExt}-add.component.css']
})
export class ${modeloSinExt}AddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  ${modeloSinExt}_addForm;
  constructor(private fb: FormBuilder , private bs: ${modeloSinExt}Service) {
    this.createForm();
  }

  createForm() {
    this.${modeloSinExt}_addForm = this.fb.group({
	
      $atribComoAddFormTS
	  
    });
  }

  add_${modeloSinExt} ($atribComoParamService) {
  this.bs.add_${modeloSinExt}($atribComoParamService);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}
"
echo "__________GENERANDO COMPONENTE ${modeloSinExt}__________"
echo " " > ./$_nombreProject/src/app/$modeloSinExt'-add'/$modeloSinExt'-add.component.css'
echo "${modeloSinExt}-add.component.css generado correctamente!"
echo "$addHTML" > ./$_nombreProject/src/app/$modeloSinExt'-add'/$modeloSinExt'-add.component.html'
echo "${modeloSinExt}-add.component.html generado correctamente!"
echo "$addTS" > ./$_nombreProject/src/app/$modeloSinExt'-add'/$modeloSinExt'-add.component.ts'
echo "${modeloSinExt}-add.component.ts generado correctamente!"

####### COMPONENTE modelo_update*************************************************************************************************
`mkdir ./$_nombreProject/src/app/$modeloSinExt'-update'`
updateHTML="
<div class='card'>
    <div class='card-body'>
        <form [formGroup]='${modeloSinExt}_updateForm' novalidate>

			$atribComoUpdateForm

            <div class='form-group'>
                <button type='button' (click)='update_${modeloSinExt}(serial.value,brand.value,model.value,ubication.value,price_shopping.value,receipt_shopping.value,creation_date.value,sale_date.value,seller_identification.value,state.value)' [disabled]='${modeloSinExt}_updateForm.invalid'
                    class='btn btn-primary'>Update ${modeloSinExt}</button>
            </div>
        </form>
    </div>
</div>
"
updateTS="
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ${modeloSinExt}Service } from '../${modeloSinExt}-services/${modeloSinExt}.service';


@Component({
  selector: 'app-${modeloSinExt}-update',
  templateUrl: './${modeloSinExt}-update.component.html',
  styleUrls: ['./${modeloSinExt}-update.component.css']
})


export class ${modeloSinExt}UpdateComponent implements OnInit {

  ${modeloSinExt}_updateForm;
  ${modeloSinExt}: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: ${modeloSinExt}Service, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.${modeloSinExt}_updateForm = this.fb.group({
      
	  $atribComoAddFormTS
	  
    });
  }

  update_${modeloSinExt}($atribComoParamService) {
    this.route.params.subscribe(params => {
      this.ms.update_${modeloSinExt}($atribComoParamService params['id']);
      this.router.navigate(['${modeloSinExt}']);
    });
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.find_${modeloSinExt}(params['id']).subscribe(res => {
        this.${modeloSinExt} = res;
      });
    });
  }
}
"
echo " " > ./$_nombreProject/src/app/$modeloSinExt'-update'/$modeloSinExt'-update.component.css'
echo "${modeloSinExt}-update.component.css generado correctamente!"
echo "$updateHTML" > ./$_nombreProject/src/app/$modeloSinExt'-update'/$modeloSinExt'-update.component.html'
echo "${modeloSinExt}-update.component.html generado correctamente!"
echo "$updateTS" > ./$_nombreProject/src/app/$modeloSinExt'-update'/$modeloSinExt'-update.component.ts'
echo "${modeloSinExt}-update.component.ts generado correctamente!"

####### COMPONENTE modelo_get*************************************************************************************************
`mkdir ./$_nombreProject/src/app/$modeloSinExt'-get'`
parteConstante1="'[ /${modeloSinExt}/update ,${modeloSinExt}._id]'"
getHTML="
<input class='form-control' type='text' name='search' placeholder='Search' [(ngModel)]='filter'>
<br>
<table class='table table-bordered'>
    <thead style='font-family: Segoe UI, Tahoma, Geneva, Verdana, sans-serif; color:rgb(81, 81, 207)'></thead>
        <tr>

            $atribComogetFormEncabe

            <td>update</td>
            <td> Delete</td>
        </tr>
    </thead>
    <tbody>
        <tr *ngFor='let mimodel of mimodel  | filter:filter'>

            $atribComogetFormCuerpo

            <td>
                <td><a [routerLink]="${parteConstante1}" class='btn btn-primary'><i class='far fa-edit'></i></a></td>
            </td>
            <td><a (click)='deletemimodel(mimodel._id) ' class='btn btn-danger '><i class='far fa-trash-alt '></i></a></td>
        </tr>
    </tbody>
</table>
<hr>
<button routerLink='/mimodel/add ' class='btn btn-primary '><i class='fas fa-plus '></i>Add new</button> &nbsp;
<button (click)='refresh() ' class='btn btn-secondary '><i class='fas fa-sync-alt '></i></button>
"
getTS="
import { Component, OnInit } from '@angular/core';
import { ${modeloSinExt}Service } from '../${modeloSinExt}-services/${modeloSinExt}.service';
import ${modeloSinExt} from '../models/${modeloSinExt}_model';

@Component({
  selector: 'app-${modeloSinExt}-get',
  templateUrl: './${modeloSinExt}-get.component.html',
  styleUrls: ['./${modeloSinExt}-get.component.css']
})
export class ${modeloSinExt}GetComponent implements OnInit {
  ${modeloSinExt}: ${modeloSinExt}[];
  constructor(private ms: ${modeloSinExt}Service) { }

  delete_${modeloSinExt}(id) {
    this.ms.delete_${modeloSinExt}(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.get_${modeloSinExt}().subscribe((data: ${modeloSinExt}[]) => {
      this.${modeloSinExt} = data;
    });
  }
}
"
echo " " > ./$_nombreProject/src/app/$modeloSinExt'-get'/$modeloSinExt'-get.component.css'
echo "${modeloSinExt}-get.component.css generado correctamente!"
echo "$getHTML" > ./$_nombreProject/src/app/$modeloSinExt'-get'/$modeloSinExt'-get.component.html'
echo "${modeloSinExt}-get.component.html generado correctamente!"
echo "$getTS" > ./$_nombreProject/src/app/$modeloSinExt'-get'/$modeloSinExt'-get.component.ts'
echo "${modeloSinExt}-get.component.ts generado correctamente!"







fi
done






####### COMPONENTE APP.COMPONENT  *************************************************************************************************
appComponentHTML="
<ng2-slim-loading-bar color='blue'></ng2-slim-loading-bar>

<nav class='navbar navbar-expand-sm bg-light'>
    <div class='container-fluid'>
        <ul class='navbar-nav'>
		
            $modelosAppComponent
			
        </ul>
    </div>
</nav>
<br>
<br>
<div class='container'>
    <router-outlet></router-outlet>
</div>
"
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
echo "$appComponentHTML" > ./$_nombreProject/src/app/app.component.html
echo "app.component.html generado correctamente!"
echo "$appComponentTs" > ./$_nombreProject/src/app/app.component.ts
echo 'app.component.ts generado correctamente!'


####### APP-ROUTING.MODULE  *************************************************************************************************
appRoutingModule="
import {NgModule} from '@angular/core';
import {Routes , RouterModule} from '@angular/router';

import { ${modeloSinExt}AddComponent } from './${modeloSinExt}-add/${modeloSinExt}-add.component';
import { ${modeloSinExt}UpdateComponent } from './${modeloSinExt}-update/${modeloSinExt}-update.component';
import { ${modeloSinExt}GetComponent } from './${modeloSinExt}-get/${modeloSinExt}-get.component';

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

import { SlimLoadingBarModule } from 'ng2-slim-loading-bar';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

$modelosAppModuleImports

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