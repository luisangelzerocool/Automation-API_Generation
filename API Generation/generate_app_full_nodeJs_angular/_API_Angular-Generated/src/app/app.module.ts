
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import {ReactiveFormsModule} from '@angular/forms';
import { HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';


import { InventaryService } from './inventary.service';
import { InventaryAddComponent } from './inventary-add/inventary-add.component';
import { InventaryGetComponent } from './inventary-get/inventary-get.component';
import { InventaryEditComponent } from './inventary-edit/inventary-edit.component';

import { InvoiceService } from './invoice.service';
import { InvoiceAddComponent } from './invoice-add/invoice-add.component';
import { InvoiceGetComponent } from './invoice-get/invoice-get.component';
import { InvoiceEditComponent } from './invoice-edit/invoice-edit.component';

import { MachineService } from './machine.service';
import { MachineAddComponent } from './machine-add/machine-add.component';
import { MachineGetComponent } from './machine-get/machine-get.component';
import { MachineEditComponent } from './machine-edit/machine-edit.component';



import { SlimLoadingBarModule } from 'ng2-slim-loading-bar';
import { Ng2SearchPipeModule } from 'ng2-search-filter';

@NgModule({
  declarations: [
    AppComponent,
    
	
    InventaryAddComponent,
    InventaryGetComponent,
    InventaryEditComponent,

    InvoiceAddComponent,
    InvoiceGetComponent,
    InvoiceEditComponent,

    MachineAddComponent,
    MachineGetComponent,
    MachineEditComponent,

	
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
  providers: [InventaryService,InvoiceService,MachineService,],
  bootstrap: [AppComponent]
})
export class AppModule { }

