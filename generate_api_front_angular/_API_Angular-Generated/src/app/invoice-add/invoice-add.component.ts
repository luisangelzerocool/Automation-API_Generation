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
      serial:  ['', Validators.compose([Validators.required, Validators.minLength(8)])],
      brand:  ['', Validators.required],
      model:  ['', Validators.required],
      ubication: ['', Validators.required],
      price_shopping:  ['', Validators.required],
      receipt_shopping: ['', Validators.required],
      creation_date: ['', Validators.required],
      sale_date:['', Validators.required],
      seller_identification:['', Validators.required],
      state: ['', Validators.required]
    });
  }

  addInvoice (serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state) {
  this.bs.addInvoice(serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}
