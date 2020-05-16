
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MachineService } from '../machine.service';


@Component({
  selector: 'app-machine-edit',
  templateUrl: './machine-edit.component.html',
  styleUrls: ['./machine-edit.component.css']
})


export class MachineEditComponent implements OnInit {

  machine_editForm;
  machine: any = {};

  // tslint:disable-next-line:max-line-length
  constructor(private route: ActivatedRoute, private router: Router, private ms: MachineService, private fb: FormBuilder) { this.createForm(); }

  createForm() {
    this.machine_editForm = this.fb.group({
      
	  identifiaction: ['', Validators.required],model: ['', Validators.required],brand: ['', Validators.required],serial: ['', Validators.required]
	  
    });
  }

  updateMachine(identifiaction,model,brand,serial) {
    this.route.params.subscribe(params => {
      this.ms.updateMachine(identifiaction,model,brand,serial ,params['id']);
      this.router.navigate(['machine']);
    });
  }


  ngOnInit() {
    this.route.params.subscribe(params => {
      this.ms.editMachine(params['id']).subscribe(res => {
        this.machine = res;
      });
    });
  }
}

