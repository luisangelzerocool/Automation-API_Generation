#!/bin/bash
echo '******GENERANDO LOS COMPONENTES******'
_nombreProject='_API_Angular-Generated'


#Remplazar palabras en archivos que esten dentro de APP recursivamente incluyendo subdirectorios
`find ./$_nombreProject/src/app/ -name "*.ts" -print | xargs sed -i "s/Machine/Invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.ts" -print | xargs sed -i "s/machine/invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.ts" -print | xargs sed -i "s/gst/invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.ts" -print | xargs sed -i "s/Gst/Invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.html" -print | xargs sed -i "s/Machine/Invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.html" -print | xargs sed -i "s/machine/invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.html" -print | xargs sed -i "s/gst/invoice/g"`
`find ./$_nombreProject/src/app/ -name "*.html" -print | xargs sed -i "s/Gst/Invoice/g"`

#Remplazar nombre de archivos de APP
`cd ./$_nombreProject/src/app/ && mv machine_model.ts invoice_model.ts `
`cd ./$_nombreProject/src/app/ && mv machine.service.ts invoice.service.ts`

`cd ./$_nombreProject/src/app/gst-get/ && mv gst-get.component.ts invoice-get.component.ts`
`cd ./$_nombreProject/src/app/gst-get/ && mv gst-get.component.html invoice-get.component.html`
`cd ./$_nombreProject/src/app/gst-get/ && mv gst-get.component.css invoice-get.component.css`

`cd ./$_nombreProject/src/app/gst-edit/ && mv gst-edit.component.ts invoice-edit.component.ts`
`cd ./$_nombreProject/src/app/gst-edit/ && mv gst-edit.component.html invoice-edit.component.html`
`cd ./$_nombreProject/src/app/gst-edit/ && mv gst-edit.component.css invoice-edit.component.css`

`cd ./$_nombreProject/src/app/gst-add/ && mv gst-add.component.ts invoice-add.component.ts`
`cd ./$_nombreProject/src/app/gst-add/ && mv gst-add.component.html invoice-add.component.html`
`cd ./$_nombreProject/src/app/gst-add/ && mv gst-add.component.css invoice-add.component.css`


#Remplazar nombre de directorios de APP
`mv ./$_nombreProject/src/app/gst-add ./$_nombreProject/src/app/invoice-add`
`mv ./$_nombreProject/src/app/gst-edit ./$_nombreProject/src/app/invoice-edit`
`mv ./$_nombreProject/src/app/gst-get ./$_nombreProject/src/app/invoice-get`



