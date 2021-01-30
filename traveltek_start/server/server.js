const express = require('express');
const app = express();
const cors = require('cors');
const flights = [
  {carrier: "Norwegian Air Int", depair: "BCN", destair: "LGW"},
  {carrier: "British Airways", depair: "LHR", destair: "CPT"},
  {carrier: "Emirates", depair: "DBY", destair: "BKK"},
  {carrier: "LoganAir", depair: "JHB", destair: "GLW"},
  {carrier: "Qatar", depair: "BBN", destair: "PTO"}
  ];

const bodyParser = require('body-parser');

app.use(bodyParser.json());

app.use(cors());

app.get('/api/flights/:id', (req, res) => {
  res.json(flights[req.params.id]);
});

app.get('/api/flights', function (req, res) {
  res.json(flights);
});

app.post('/api/flights', (req, res) => {
  flights.push(req.body);
  res.json(flights);
});
app.delete('/api/flights/:id', (req, res) => {
  flights.splice(req.params.id, 1);
  res.json(flights);
});
app.put('/api/flights/:id', (req, res) => {
  flights[req.params.id] = req.body;
  res.json(flights);
});

app.listen(3000, function () {
  console.log('App running on port 3000');
});
