
const express = require('express');
const app = express();
const machineRouter = express.Router();

let machine = require('../models/machine');

machineRouter.route('/add').post((req, res) => {
    let machineInstance = new machine(req.body);
    machineInstance.save().then(machineInstance => {
            res.status(200).json({ 'machineInstance': 'machineInstance is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  machineInstance to database');
        });
});

machineRouter.route('/').get((req, res) => {
    machine.find(function(err, machineInstance) {
        if (machineInstance) {
            res.json(machineInstance);
        } else {
            console.log(err);
        }
    });
});

machineRouter.route('/edit/:id').get((req, res) => {
    let id = req.params.id;
    machine.findById(id, (err, machineInstance) => {
        res.json(machineInstance);
    });
});

machineRouter.route('/update/:id').post((req, res) => {
    machine.findById(req.params.id, (err, machineInstance) => {
        if (!machineInstance) {
            return next(new Error('Could not load the document'));
        } else {


            machineInstance .identification=req.body.identification;machineInstance .details=req.body.details;machineInstance .valuer=req.body.valuer;



            machineInstance.save().then(machineInstance => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

machineRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    machine.findByIdAndDelete(id, (err, machineInstance) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = machineRouter;

