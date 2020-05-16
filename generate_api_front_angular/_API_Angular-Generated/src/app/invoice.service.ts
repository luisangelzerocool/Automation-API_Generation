import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class InvoiceService {

  uri = 'http://localhost:3000/invoiceapi';


  constructor(private http: HttpClient) { }

  addInvoice(serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state) {
    const obj = {
      serial:serial,
      brand:brand,
      model:model,
      ubication:ubication,
      price_shopping:price_shopping,
      receipt_shopping:receipt_shopping,
      creation_date:creation_date,
      sale_date:sale_date,
      seller_identification:seller_identification,
      state:state
    };
    console.log(obj);
    this.http.post(`${this.uri}/add`, obj)
      .subscribe(res => console.log('Done'));
  }

  getInvoice() {
    return this.http.get(`${this.uri}`);
  }

  editInvoice(id) {
    return this.http.get(`${this.uri}/edit/${id}`);
  }

  updateInvoice(serial,brand,model,ubication,price_shopping,receipt_shopping,creation_date,sale_date,seller_identification,state,id) {
    const obj = {
      serial:serial,
      brand:brand,
      model:model,
      ubication:ubication,
      price_shopping:price_shopping,
      receipt_shopping:receipt_shopping,
      creation_date:creation_date,
      sale_date:sale_date,
      seller_identification:seller_identification,
      state:state
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteInvoice(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

