
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { LuisService } from '../luis.service';


@Component({
  selector: 'app-luis-edit',
  templateUrl: './luis-edit.component.html',
  styleUrls: ['./luis-edit.component.css']
})


export class LuisEditComponent implements OnInit {

  luis_editForm;
  luis: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: LuisService, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.luis_editForm = this.fb.group({
      
	  luis1: ['', Validators.required],luis2: ['', Validators.required]
	  
    });
  }

  updateLuis(luis1,luis2) {
    this.route.params.subscribe(params => {
      this.ms.updateLuis(luis1,luis2 ,params['id']);
      this.router.navigate(['luis']);
    });
  }


  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.editLuis(params['id']).subscribe(res => {
        this.luis = res;
      });
    });
  }
}

