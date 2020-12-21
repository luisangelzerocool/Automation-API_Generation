
import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { LuisService } from '../luis.service';

@Component({
  selector: 'app-luis-add',
  templateUrl: './luis-add.component.html',
  styleUrls: ['./luis-add.component.css']
})
export class LuisAddComponent implements OnInit {
  dataadded = false;
  msg: String ;
  luis_addForm;
  constructor(private fb: FormBuilder , private bs: LuisService) {
    this.createForm();
  }

  createForm() {
    this.luis_addForm = this.fb.group({
      
	  luis1: ['', Validators.required],luis2: ['', Validators.required]
	  
    });
  }

  addLuis (luis1,luis2) {
  this.bs.addLuis(luis1,luis2);
  location.reload();
  this.dataadded = true;
  this.msg = 'Data Added successfully';
  }

  ngOnInit() {
  }

}

