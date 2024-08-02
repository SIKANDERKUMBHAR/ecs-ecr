const express = require('express');
const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.send('Hello, World! \n deployed using terraform 23');
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
