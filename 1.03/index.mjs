const { randomUUID } = await import('crypto')

function displayId() {
    const currentDate = new Date().toISOString()
    console.log(`${currentDate}: ${id}`)
}

const id  = randomUUID()
displayId()
setInterval(displayId, 5000)
