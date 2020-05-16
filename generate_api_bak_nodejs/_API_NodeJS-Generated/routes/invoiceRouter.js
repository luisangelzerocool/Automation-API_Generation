
const express = require('express');
const app = express();
const invoiceRouter = express.Router();

let invoice = require('../models/invoice');

invoiceRouter.route('/add').post((req, res) => {
    let invoiceInstance = new invoice(req.body);
    invoiceInstance.save().then(invoiceInstance => {
            res.status(200).json({ 'invoiceInstance': 'invoiceInstance is added successfully' });
        })
        .catch(err => {
            res.status(400).send('Unable to add  invoiceInstance to database');
        });
});

invoiceRouter.route('/').get((req, res) => {
    invoice.find(function(err, invoiceInstance) {
        if (invoiceInstance) {
            res.json(invoiceInstance);
        } else {
            console.log(err);
        }
    });
});

invoiceRouter.route('/edit/:id').get((req, res) => {
    let id = req.params.id;
    invoice.findById(id, (err, invoiceInstance) => {
        res.json(invoiceInstance);
    });
});

invoiceRouter.route('/update/:id').post((req, res) => {
    invoice.findById(req.params.id, (err, invoiceInstance) => {
        if (!invoiceInstance) {
            return next(new Error('Could not load the document'));
        } else {


            invoiceInstance .numero=req.body.numero;invoiceInstance .detalle=req.body.detalle;invoiceInstance .valor=req.body.valor;



            invoiceInstance.save().then(invoiceInstance => {
                    res.json('Data Updated Successfully');
                })
                .catch(err => {
                    res.status(400).send('Unable to update the database');
                });
        }
    });
});

invoiceRouter.route('/delete/:id').get((req, res) => {
    let id = req.params.id;
    invoice.findByIdAndDelete(id, (err, invoiceInstance) => {
        if (err) {
            res.json(err)
        } else {
            res.json('Data Removed Successfully');
        }
    });
});

module.exports = invoiceRouter;

