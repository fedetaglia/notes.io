// call function once
window.setTimeout(callbackFunction, delayMillisecods);


// call function with a delay in between each call
window.setInterval(callbackFunction,delayMillisecods);



// ex make image bigger overtime

function makeImageBigger() {
var img = document.getElementById("mainpicture");
img.setAttribute('width', img.width+10);
}

window.setInterval(makeImageBigger, 1000);