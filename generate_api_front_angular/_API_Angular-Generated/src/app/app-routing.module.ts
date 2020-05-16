
import {NgModule} from '@angular/core';
import {Routes , RouterModule} from '@angular/router';



import { InvoiceAddComponent } from './invoice-add/invoice-add.component';
import { InvoiceEditComponent } from './invoice-edit/invoice-edit.component';
import { InvoiceGetComponent } from './invoice-get/invoice-get.component';

import { MachineAddComponent } from './machine-add/machine-add.component';
import { MachineEditComponent } from './machine-edit/machine-edit.component';
import { MachineGetComponent } from './machine-get/machine-get.component';




const routes = [
    
	
	{
        path: 'invoice/create',
        component: InvoiceAddComponent
    },
    {
        path: 'invoice',
        component: InvoiceGetComponent
    } ,
    {
        path: 'invoice/edit/:id',
        component: InvoiceEditComponent
    },

	{
        path: 'machine/create',
        component: MachineAddComponent
    },
    {
        path: 'machine',
        component: MachineGetComponent
    } ,
    {
        path: 'machine/edit/:id',
        component: MachineEditComponent
    },

	
];

@NgModule({
    imports: [RouterModule.forRoot(routes)] ,
    exports: [RouterModule]
})

export class AppRoutingModule {
}

