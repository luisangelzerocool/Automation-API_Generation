
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
      
	  modelo: ['', Validators.required],numero: ['', Validators.required],detalle: ['', Validators.required],valor: ['', Validators.required]
	  
    });
  }

  addMachine (modelo,numero,detalle,valor) {
  this.bs.addMachine(modelo,numero,detalle,valor);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

