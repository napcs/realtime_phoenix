import {Socket} from "phoenix";

let socket = new Socket("/ws");
socket.connect();

let App = {
  connectToPad: id => {
    let channel = socket.chan(`pad:${id}`)
    channel.join().receive("ok", channel => {
      console.log("Connected!");
    });
  }
};

if(window.appConfig !== undefined) {
  window.appConfig.onPageLoad.call(this, App);
}

export default App;
