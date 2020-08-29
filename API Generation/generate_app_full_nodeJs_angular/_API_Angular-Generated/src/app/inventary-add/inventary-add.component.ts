
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { InventaryService } from '../inventary.service';

@Component({
  selector: 'app-inventary-add',
  templateUrl: './inventary-add.component.html',
  styleUrls: ['./inventary-add.component.css']
})
export class InventaryAddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  inventary_addForm;
  constructor(private fb: FormBuilder , private bs: InventaryService) {
    this.createForm();
  }

  createForm() {
    this.inventary_addForm = this.fb.group({
      
	  identification: ['', Validators.required],nro_inventary: ['', Validators.required],detail: ['', Validators.required]
	  
    });
  }

  addInventary (identification,nro_inventary,detail) {
  this.bs.addInventary(identification,nro_inventary,detail);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

