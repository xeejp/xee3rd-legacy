import {Socket} from "phoenix"

let socket = new Socket("/experiment")
socket.connect()
let chan = socket.chan(_channel_topic, {}) // _channel_topic is provided by ExperimentController
chan.join().receive("ok", resp => {
  console.log("Joined succesffuly!", resp)
})

chann.on("update", payload => {
  messagesContainer.append(`<br/>[${Date()}] ${payload.body}`)
})

function _send_data(data) {
    // TODO Do json encode the data
    chan.push("updata", data)
}
