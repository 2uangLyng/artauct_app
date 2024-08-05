const express = require('express');
const mongoose = require('mongoose');
const app = express();
const cors = require('cors');
const productRoutes = require('./routes/product.route.js');
const Product = require('./models/product.model.js');


//middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

//routes
app.use('/api/products', productRoutes);

app.get('/', (req, res) => {
    res.send('Hello World from Express');
});

mongoose.connect("mongodb+srv://admin:admin123@backenddb.2229cve.mongodb.net/Node-API?retryWrites=true&w=majority&appName=BackendDB")
    .then(() => {
        console.log('Connected to MongoDB');
        app.listen(5000, () => {
            console.log('Server is running on port 5000');
        });

    })
    .catch((err) => {
        console.log('Failed to connect to MongoDB', err);
    });