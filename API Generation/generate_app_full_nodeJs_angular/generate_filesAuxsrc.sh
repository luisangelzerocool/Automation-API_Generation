#!/bin/bash
_nombreProject=$1


#tsconfig.app.json
tsconfig='
{
  "extends": "../tsconfig.json",
  "compilerOptions": {
    "outDir": "../out-tsc/app",
    "types": []
  },
  "exclude": [
    "test.ts",
    "**/*.spec.ts"
  ]
}

'
echo "$tsconfig" > ./$_nombreProject/src/tsconfig.app.json
echo '  - tsconfig.app.json, OK!'

#styles.css
styles='
/* You can add global styles to this file, and also import other style files */
@import "../node_modules/ng2-slim-loading-bar/style.css";
'
echo "$styles" > ./$_nombreProject/src/styles.css
echo '  - styles.css, OK!'

#polyfills.ts
polyfills="
import 'zone.js/dist/zone';  // Included with Angular CLI.
"
echo "$polyfills" > ./$_nombreProject/src/polyfills.ts
echo '  - polyfills.ts, OK!'

#main.ts
main="
import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

if (environment.production) {
  enableProdMode();
}

platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => console.error(err));

"
echo "$main" > ./$_nombreProject/src/main.ts
echo '  - main.ts, OK!'


#browserslist
browserslist='
# This file is currently used by autoprefixer to adjust CSS to support the below specified browsers
# For additional information regarding the format and rule options, please see:
# https://github.com/browserslist/browserslist#queries
#
# For IE 9-11 support, please remove 'not' from the last line of the file and adjust as needed

> 0.5%
last 2 versions
Firefox ESR
not dead
not IE 9-11
'
echo "$browserslist" > ./$_nombreProject/src/browserslist
echo '  - browserslist, OK!'