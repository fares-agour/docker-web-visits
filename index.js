const express = require('express');
const redis = require('redis');
const app = express();
const client = redis.createClient({ host: 'redis' });

app.get('/', (req, res) => {
  client.incr('visits', (err, visits) => {
    if (err) {
      return res.status(500).send('Error');
    }
    res.send(`--------- Number of your visits: ${visits}, USER !!! -----------`);
  });
});


app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
