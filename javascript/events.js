EVENT is object

// http://www.w3schools.com/js/js_htmldom_events.asp

<button id="mybutt">do stuff</button>

<script>
  document.getElementById("mybutt").addEventListener('click',myJavascriptFunction);
</script>


// this function will be called on page-load
function onLoad() {



}

// attach the js to the onload event so it doesn0t get called before the page load
window.addEventListener('load', onLoad);




var kitten = document.getElementById("kitten");
var infoDiv = document.getElementById("info");

function kittclick(event) {
infoDiv.innerHTML = "click at " + event.clientX + " , " + event.clientY;
}

kitten.addEventListener('click',kittclick);




var button = document.getElementById("sayit");
var theName = document.getElementById('name');
var info = document.getElementById('info');

function sayMyName(event) {
  var name = document.getElementById("name").value;
  if (name.length > 3 ) {
    alert("hi " + name);
  }
  else {
    alert(name + " is too short. Plese use 3 or more characters");
  }
}

function setErrors(event) {
  var name = theName.value;
  if (name.length < 2 ) {
    info.style.textColor = "red";
    theName.style.border = "3px solid red";
    info.innerHTML = "too shooort. keep going ...";
  }
  else {
    info.innerHTML = "";
    theName.style.border = "";
  }
}

// keypress only writing keys
// keydown all keys

theName.addEventListener("keydown",setErrors);
button.addEventListener('click',sayMyName);