import {Socket} from "phoenix"
import Vue from "vue"

new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue.js!'
  }
});
// let socket = new Socket("/ws")
// socket.connect()
// let chan = socket.chan("topic:subtopic", {})
// chan.join().receive("ok", resp => {
//   console.log("Joined succesffuly!", resp)
// })

let App = {
    run: () => {
    }
}

export default App
