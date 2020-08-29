
const express = require('express');
const app = express();
const inventaryRouter = express.Router();

let inventary = require('../models/inventary');

inventaryRouter.route('/add').post((req, res) => {
    let inventaryInstance = new inventary(req.body);
    inventaryInstance.save().then(inventaryInstance => {
            res.status(200).json({ 'inventaryInstance': 'inventaryInstance is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  inventaryInstance to database');
        });
});

inventaryRouter.route('/').get((req, res) => {
    inventary.find(function(err, inventaryInstance) {
        if (inventaryInstance) {
            res.json(inventaryInstance);
        } else {
            console.log(err);
        }
    });
});

inventaryRouter.route('/edit/:id').get((req, res) => {
    let id = req.params.id;
    inventary.findById(id, (err, inventaryInstance) => {
        res.json(inventaryInstance);
    });
});

inventaryRouter.route('/update/:id').post((req, res) => {
    inventary.findById(req.params.id, (err, inventaryInstance) => {
        if (!inventaryInstance) {
            return next(new Error('Could not load the document'));
        } else {


            inventaryInstance .identification=req.body.identification;inventaryInstance .details=req.body.details;inventaryInstance .valuer=req.body.valuer;



            inventaryInstance.save().then(inventaryInstance => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

inventaryRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    inventary.findByIdAndDelete(id, (err, inventaryInstance) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = inventaryRouter;

