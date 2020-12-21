
const express = require('express');
const app = express();
const luisRouter = express.Router();

let luis = require('../models/luis');

luisRouter.route('/add').post((req, res) => {
    let luisInstance = new luis(req.body);
    luisInstance.save().then(luisInstance => {
            res.status(200).json({ 'luisInstance': 'luisInstance is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  luisInstance to database');
        });
});

luisRouter.route('/').get((req, res) => {
    luis.find(function(err, luisInstance) {
        if (luisInstance) {
            res.json(luisInstance);
        } else {
            console.log(err);
        }
    });
});

luisRouter.route('/edit/:id').get((req, res) => {
    let id = req.params.id;
    luis.findById(id, (err, luisInstance) => {
        res.json(luisInstance);
    });
});

luisRouter.route('/update/:id').post((req, res) => {
    luis.findById(req.params.id, (err, luisInstance) => {
        if (!luisInstance) {
            return next(new Error('Could not load the document'));
        } else {


            luisInstance .luis1=req.body.luis1;luisInstance .luis2=req.body.luis2;



            luisInstance.save().then(luisInstance => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

luisRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    luis.findByIdAndDelete(id, (err, luisInstance) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = luisRouter;

