
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LuisService {

  uri = 'http://localhost:3000/luis';


  constructor(private http: HttpClient) { }

  addLuis(luis1,luis2) {
    const obj = {
      
	  luis1:luis1,luis2:luis2
	  
    };
    console.log(obj);
    this.http.post(`${this.uri}/add`, obj)
      .subscribe(res => console.log('Done'));
  }

  getLuis() {
    return this.http.get(`${this.uri}`);
  }

  editLuis(id) {
    return this.http.get(`${this.uri}/edit/${id}`);
  }

  updateLuis(luis1,luis2 ,id) {
    const obj = {
      
	  luis1:luis1,luis2:luis2
	  
    };
    this.http.post(`${this.uri}/update/${id}`, obj)
      .subscribe(res => console.log('Done'));
  }

  deleteLuis(id) {
    return this.http.get(`${this.uri}/delete/${id}`);
  }
  
}

