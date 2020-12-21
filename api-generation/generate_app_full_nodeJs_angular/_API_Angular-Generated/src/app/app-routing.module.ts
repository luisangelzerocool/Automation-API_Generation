
import {NgModule} from '@angular/core';
import {Routes , RouterModule} from '@angular/router';



import { LuisAddComponent } from './luis-add/luis-add.component';
import { LuisEditComponent } from './luis-edit/luis-edit.component';
import { LuisGetComponent } from './luis-get/luis-get.component';




const routes = [
    
	
	{
        path: 'luis/create',
        component: LuisAddComponent
    },
    {
        path: 'luis',
        component: LuisGetComponent
    } ,
    {
        path: 'luis/edit/:id',
        component: LuisEditComponent
    },

	
];

@NgModule({
    imports: [RouterModule.forRoot(routes)] ,
    exports: [RouterModule]
})

export class AppRoutingModule {
}

