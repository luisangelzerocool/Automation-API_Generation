#!/bin/bash
_modelo=$1
_modeloRouter=$2
_modeloMinus=$3
_atributos=(`cat /tempfiles/atributosFile`)

#creo una estructura para los atributos y sus tipos String
atributosEstructurados=""
for i in "${_atributos[@]}"
do
atributosEstructurados=$atributosEstructurados"$_modeloMinus ."
atributosEstructurados=$atributosEstructurados"${i}="
atributosEstructurados=$atributosEstructurados'req.body.'
atributosEstructurados=$atributosEstructurados"${i};"
done

route="const express = require('express');
const app = express();
const $_modeloRouter = express.Router();

let $_modelo = require('../models/$_modelo');

$_modeloRouter.route('/add').post((req, res) => {
    let $_modeloMinus = new $_modelo(req.body);
    $_modeloMinus.save().then($_modeloMinus => {
            res.status(200).json({ '$_modeloMinus': '$_modeloMinus is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  $_modeloMinus to database');
        });
});

$_modeloRouter.route('/').get((req, res) => {
    $_modelo.find(function(err, $_modeloMinus) {
        if ($_modeloMinus) {
            res.json($_modeloMinus);
        } else {
            console.log(err);
        }
    });
});

$_modeloRouter.route('/edit/:id').get((req, res) => {
    let id = req.params.id;
    $_modelo.findById(id, (err, $_modeloMinus) => {
        res.json($_modeloMinus);
    });
});

$_modeloRouter.route('/update/:id').post((req, res) => {
    $_modelo.findById(req.params.id, (err, $_modeloMinus) => {
        if (!$_modeloMinus) {
            return next(new Error('Could not load the document'));
        } else {


            $atributosEstructurados



            $_modeloMinus.save().then($_modeloMinus => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

$_modeloRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    $_modelo.findByIdAndDelete(id, (err, $_modeloMinus) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = $_modeloRouter;"

echo $route > ./_API_NodeJS-Generated/routes/$_modeloRouter.js 
echo 'modeloRouter.js generado correctamente!'

