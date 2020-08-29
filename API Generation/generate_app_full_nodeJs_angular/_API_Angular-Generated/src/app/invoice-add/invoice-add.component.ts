
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
      
	  identification: ['', Validators.required],details: ['', Validators.required],value: ['', Validators.required]
	  
    });
  }

  addInvoice (identification,details,value) {
  this.bs.addInvoice(identification,details,value);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

