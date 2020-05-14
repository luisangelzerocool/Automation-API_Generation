
const express = require('express');
const app = express();
const mimodelRouter = express.Router();

let mimodel = require('../models/mimodel');

mimodelRouter.route('/add').post((req, res) => {
    let mimodelInstance = new mimodel(req.body);
    mimodelInstance.save().then(mimodelInstance => {
            res.status(200).json({ 'mimodelInstance': 'mimodelInstance is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  mimodelInstance to database');
        });
});

mimodelRouter.route('/findall').get((req, res) => {
    mimodel.find(function(err, mimodelInstance) {
        if (mimodelInstance) {
            res.json(mimodelInstance);
        } else {
            console.log(err);
        }
    });
});

mimodelRouter.route('/find/:id').get((req, res) => {
    let id = req.params.id;
    mimodel.findById(id, (err, mimodelInstance) => {
        res.json(mimodelInstance);
    });
});

mimodelRouter.route('/update/:id').post((req, res) => {
    mimodel.findById(req.params.id, (err, mimodelInstance) => {
        if (!mimodelInstance) {
            return next(new Error('Could not load the document'));
        } else {


            mimodelInstance .uno=req.body.uno;mimodelInstance .dos=req.body.dos;mimodelInstance .tres=req.body.tres;



            mimodelInstance.save().then(mimodelInstance => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

mimodelRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    mimodel.findByIdAndDelete(id, (err, mimodelInstance) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = mimodelRouter;

