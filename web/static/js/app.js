import {Socket} from "phoenix";

let socket = new Socket("/ws");
socket.connect();

let App = {
  connectToPad: id => {
    let channel = socket.chan(`pad:${id}`)
    channel.join().receive("ok", channel => {
      console.log("Connected!");
    });

    let pad = document.getElementById("pad");
    pad.addEventListener('input',(event) => {
      console.log(pad.value);
      channel.push("change:pad", {content: pad.value});
    });

    channel.on("update:pad", (message) => {
        console.log(message.content);
      pad.value = message.content;
    });
  }
};

if(window.appConfig !== undefined) {
  window.appConfig.onPageLoad.call(this, App);
}

export default App;
