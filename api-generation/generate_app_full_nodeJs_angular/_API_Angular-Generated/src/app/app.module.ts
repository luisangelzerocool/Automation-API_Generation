
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';


import { LuisService } from './luis.service';
import { LuisAddComponent } from './luis-add/luis-add.component';
import { LuisGetComponent } from './luis-get/luis-get.component';
import { LuisEditComponent } from './luis-edit/luis-edit.component';



import { SlimLoadingBarModule } from 'ng2-slim-loading-bar';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

@NgModule({
  declarations: [
    AppComponent,
    
	
    LuisAddComponent,
    LuisGetComponent,
    LuisEditComponent,

	
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
  providers: [LuisService,],
  bootstrap: [AppComponent]
})
export class AppModule { }

