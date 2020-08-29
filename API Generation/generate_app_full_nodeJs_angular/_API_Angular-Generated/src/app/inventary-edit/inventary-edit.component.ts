
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { InventaryService } from '../inventary.service';


@Component({
  selector: 'app-inventary-edit',
  templateUrl: './inventary-edit.component.html',
  styleUrls: ['./inventary-edit.component.css']
})


export class InventaryEditComponent implements OnInit {

  inventary_editForm;
  inventary: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: InventaryService, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.inventary_editForm = this.fb.group({
      
	  identification: ['', Validators.required],nro_inventary: ['', Validators.required],detail: ['', Validators.required]
	  
    });
  }

  updateInventary(identification,nro_inventary,detail) {
    this.route.params.subscribe(params => {
      this.ms.updateInventary(identification,nro_inventary,detail ,params['id']);
      this.router.navigate(['inventary']);
    });
  }


  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.editInventary(params['id']).subscribe(res => {
        this.inventary = res;
      });
    });
  }
}

