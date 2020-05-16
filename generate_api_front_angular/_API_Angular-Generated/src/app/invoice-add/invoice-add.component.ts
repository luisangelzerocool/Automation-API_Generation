
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { InvoiceService } from '../invoice.service';

@Component({
  selector: 'app-invoice-add',
  templateUrl: './invoice-add.component.html',
  styleUrls: ['./invoice-add.component.css']
})
export class InvoiceAddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  invoice_addForm;
  constructor(private fb: FormBuilder , private bs: InvoiceService) {
    this.createForm();
  }

  createForm() {
    this.invoice_addForm = this.fb.group({
      
	  numero: ['', Validators.required],detalle: ['', Validators.required],valor: ['', Validators.required]
	  
    });
  }

  addInvoice (numero,detalle,valor) {
  this.bs.addInvoice(numero,detalle,valor);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

