import express from 'express'
const { randomUUID } = await import('crypto')

function normalizePort(val) {
  var port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}

const app = express()

var port = normalizePort(process.env.PORT || '8080');
app.set('port', port);

let id = 0
app.get('/pingpong', (req, res) => {
  res.send(`pong ${id++}`)
})

app.listen(port, () => {
  console.log(`Listening on port ${port}`)
})