
import { Component, OnInit } from '@angular/core';
import { LuisService } from '../luis.service';
import Luis from '../luis_model';

@Component({
  selector: 'app-luis-get',
  templateUrl: './luis-get.component.html',
  styleUrls: ['./luis-get.component.css']
})
export class LuisGetComponent implements OnInit {
  luis: Luis[];
  constructor(private ms: LuisService) { }

  deleteLuis(id) {
    this.ms.deleteLuis(id).subscribe(res => {
      console.log('Deleted');
      this.ngOnInit();
    });
  }

  refresh() {
    location.reload();
  }
  ngOnInit() {
    this.ms.getLuis().subscribe((data: Luis[]) => {
      this.luis = data;
    });
  }

}

