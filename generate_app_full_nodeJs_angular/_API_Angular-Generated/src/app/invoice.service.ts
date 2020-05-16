
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class InvoiceService {

  uri = 'http://localhost:3000/invoice';


  constructor(private http: HttpClient) { }

  addInvoice(identification,details,value) {
    const obj = {
      
	  identification:identification,details:details,value:value
	  
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

  updateInvoice(identification,details,value ,id) {
    const obj = {
      
	  identification:identification,details:details,value:value
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteInvoice(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

