
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class InventaryService {

  uri = 'http://localhost:3000/inventary';


  constructor(private http: HttpClient) { }

  addInventary(identification,nro_inventary,detail) {
    const obj = {
      
	  identification:identification,nro_inventary:nro_inventary,detail:detail
	  
    };
    console.log(obj);
    this.http.post(`${this.uri}/add`, obj)
      .subscribe(res => console.log('Done'));
  }

  getInventary() {
    return this.http.get(`${this.uri}`);
  }

  editInventary(id) {
    return this.http.get(`${this.uri}/edit/${id}`);
  }

  updateInventary(identification,nro_inventary,detail ,id) {
    const obj = {
      
	  identification:identification,nro_inventary:nro_inventary,detail:detail
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteInventary(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

