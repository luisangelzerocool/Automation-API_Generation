import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { InvoiceService } from '../invoice.service';


@Component({
  selector: 'app-invoice-edit',
  templateUrl: './invoice-edit.component.html',
  styleUrls: ['./invoice-edit.component.css']
})


export class InvoiceEditComponent implements OnInit {

  invoice_editForm;
  invoice: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: InvoiceService, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.invoice_editForm = this.fb.group({
      serial:  ['', Validators.required],
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

  updateInvoice(serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state) {
    this.route.params.subscribe(params => {
      this.ms.updateInvoice(serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state, params['id']);
      this.router.navigate(['invoice']);
    });
  }


  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.editInvoice(params['id']).subscribe(res => {
        this.invoice = res;
      });
    });
  }
}
