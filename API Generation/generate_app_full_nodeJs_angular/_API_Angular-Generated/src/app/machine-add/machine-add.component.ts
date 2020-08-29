
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { MachineService } from '../machine.service';

@Component({
  selector: 'app-machine-add',
  templateUrl: './machine-add.component.html',
  styleUrls: ['./machine-add.component.css']
})
export class MachineAddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  machine_addForm;
  constructor(private fb: FormBuilder , private bs: MachineService) {
    this.createForm();
  }

  createForm() {
    this.machine_addForm = this.fb.group({
      
	  identifiaction: ['', Validators.required],model: ['', Validators.required],brand: ['', Validators.required],serial: ['', Validators.required]
	  
    });
  }

  addMachine (identifiaction,model,brand,serial) {
  this.bs.addMachine(identifiaction,model,brand,serial);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

