
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class MachineService {

  uri = 'http://localhost:3000/machine';


  constructor(private http: HttpClient) { }

  addMachine(modelo,numero,detalle,valor) {
    const obj = {
      
	  modelo:modelo,numero:numero,detalle:detalle,valor:valor
	  
    };
    console.log(obj);
    this.http.post(`${this.uri}/add`, obj)
      .subscribe(res => console.log('Done'));
  }

  getMachine() {
    return this.http.get(`${this.uri}`);
  }

  editMachine(id) {
    return this.http.get(`${this.uri}/edit/${id}`);
  }

  updateMachine(modelo,numero,detalle,valor ,id) {
    const obj = {
      
	  modelo:modelo,numero:numero,detalle:detalle,valor:valor
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteMachine(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

