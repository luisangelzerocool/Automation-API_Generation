
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class MachineService {

  uri = 'http://localhost:3000/machine';


  constructor(private http: HttpClient) { }

  addMachine(identifiaction,model,brand,serial) {
    const obj = {
      
	  identifiaction:identifiaction,model:model,brand:brand,serial:serial
	  
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

  updateMachine(identifiaction,model,brand,serial ,id) {
    const obj = {
      
	  identifiaction:identifiaction,model:model,brand:brand,serial:serial
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteMachine(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

