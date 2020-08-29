
import { Component, OnInit } from '@angular/core';
import { InventaryService } from '../inventary.service';
import Inventary from '../inventary_model';

@Component({
  selector: 'app-inventary-get',
  templateUrl: './inventary-get.component.html',
  styleUrls: ['./inventary-get.component.css']
})
export class InventaryGetComponent implements OnInit {
  inventary: Inventary[];
  constructor(private ms: InventaryService) { }

  deleteInventary(id) {
    this.ms.deleteInventary(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.getInventary().subscribe((data: Inventary[]) => {
      this.inventary = data;
    });
  }

}

