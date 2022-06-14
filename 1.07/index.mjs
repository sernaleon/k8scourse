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

function logId() {
    console.log(getIdString())
}

function getIdString() {
    const currentDate = new Date().toISOString()
    return `${currentDate}: ${id}`
}


const app = express()

var port = normalizePort(process.env.PORT || '8080');
app.set('port', port);


const id  = randomUUID()

app.get('/', (req, res) => {
    res.send(getIdString())
})

app.listen(port, () => {
    console.log(`Listening on port ${port}`)
})

logId()
setInterval(logId, 5000)
