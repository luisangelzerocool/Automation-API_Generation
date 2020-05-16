
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class InvoiceService {

  uri = 'http://localhost:3000/invoice';


  constructor(private http: HttpClient) { }

  addInvoice(numero,detalle,valor) {
    const obj = {
      
	  numero:numero,detalle:detalle,valor:valor
	  
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

  updateInvoice(numero,detalle,valor ,id) {
    const obj = {
      
	  numero:numero,detalle:detalle,valor:valor
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteInvoice(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

