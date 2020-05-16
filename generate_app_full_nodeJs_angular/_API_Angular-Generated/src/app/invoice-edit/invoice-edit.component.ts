
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
      
	  identification: ['', Validators.required],details: ['', Validators.required],value: ['', Validators.required]
	  
    });
  }

  updateInvoice(identification,details,value) {
    this.route.params.subscribe(params => {
      this.ms.updateInvoice(identification,details,value ,params['id']);
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

