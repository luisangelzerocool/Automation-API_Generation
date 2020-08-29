
import { Component, OnInit } from '@angular/core';
import { InvoiceService } from '../invoice.service';
import Invoice from '../invoice_model';

@Component({
  selector: 'app-invoice-get',
  templateUrl: './invoice-get.component.html',
  styleUrls: ['./invoice-get.component.css']
})
export class InvoiceGetComponent implements OnInit {
  invoice: Invoice[];
  constructor(private ms: InvoiceService) { }

  deleteInvoice(id) {
    this.ms.deleteInvoice(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.getInvoice().subscribe((data: Invoice[]) => {
      this.invoice = data;
    });
  }

}

