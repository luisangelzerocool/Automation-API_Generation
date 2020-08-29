
import { Component, OnInit } from '@angular/core';
import { MachineService } from '../machine.service';
import Machine from '../machine_model';

@Component({
  selector: 'app-machine-get',
  templateUrl: './machine-get.component.html',
  styleUrls: ['./machine-get.component.css']
})
export class MachineGetComponent implements OnInit {
  machine: Machine[];
  constructor(private ms: MachineService) { }

  deleteMachine(id) {
    this.ms.deleteMachine(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.getMachine().subscribe((data: Machine[]) => {
      this.machine = data;
    });
  }

}

