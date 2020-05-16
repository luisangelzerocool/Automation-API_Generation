import {NgModule} from '@angular/core';
import {Routes , RouterModule} from '@angular/router';

import { InvoiceAddComponent } from './invoice-add/invoice-add.component';
import { InvoiceEditComponent } from './invoice-edit/invoice-edit.component';
import { InvoiceGetComponent } from './invoice-get/invoice-get.component';

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
        component: InvoiceEditComponent,

    }
];

@NgModule({
    imports: [RouterModule.forRoot(routes)] ,
    exports: [RouterModule]
})

export class AppRoutingModule {

}
