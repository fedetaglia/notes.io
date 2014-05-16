http://repl.it/languages/JavaScript

key-sensitive!

console.log('hi\with a new line');
console.log("doble quotes if I want to have ' single quote")
console.log('single quotes if I want to have "doble quotes" inside')

VARIABLE
var x;


var types
  string
  number
  boolean
  undefined
  null

var start with letter $ or _

better name with CapitalLetterStyle instead that using_undescores !

typeof greeting;
=> 'string'

CONSTANTS
const area_code '2010';

COMMENTS

x = x + 1 // this is a comment up the end of the line
/* this
 * is a
 * multiline
 * comment
*/

FUNCTION
return a value

function sayMyName (myName) {
  console.log('hi ' + myName);
  return result; // after return the result it goes out of the function
}

FUNCTION TO CREATE FUNCTIONS

function makeMult(mult) { 
..   function MultBy(x) { 
..     return x * mult; 
..     } 
..     return MultBy; 
..     }
   multBy2 = makeMult(2);
=> [Function: MultBy]
   multBy2(3);
=> 6


return arguments


PROCEDURE
do not return a value



STRING TO INTEGER

x = 5;
y = '6';

x + parseInt(y);
x + +y;



IF STATEMENT

if (conditionalExpression) {
  // do stuff here
  }
else if (secondCondition) {
  // do this
}
else {
  // do that
}



empty       string considered false
0           is considered false
undefined   is cosidered false


// after the if block

x = 5       assign new value to the variable
x == '5'    give true - js force the var type
x === '5'   give false - one is number and the otherone not

x != '5'    give false
x !== '5'   give true   they are not equal




function assignGrade(score) { 
   if (score >= 90) { 
      grade = 'A';
        }
    else if (score >= 75 ) {
      grade = 'B';
    }
        else if (score >= 60 ){
      grade = 'C';
    }
        else if (score >= 50 ) {
      grade = 'D';
    }
        else if (score >= 40 ) {
      grade = 'E';
    }
    else {
      grade = 'F';
    }

    console.log ('the grade is ' + grade)
    }


function pluralize(noun,num) {

if (num > 1 ) {
  noun = noun + 's';
}
  console.log(num + ' ' + noun);
}



switch (expression) {  
  case value1:
    // statements for 1
    break;
  case value2:
    // statements for 2
    break;
  case value1:
    // statements for 1
    break;
  default:
    // statements default
    break;
}

inizializer_condition;
while (conditionalExpression) {
  statements;
  update statement;  
}

x = 0;
while (x<5) {
  // do something;
  x = x +1;
}

for (i = 0; i <= 20; i = i +1 ) { 
  if (i % 2 == 0){ 
  console.log(i + ' is even'); 
  } 
}



myarray = ['green', 'blue', 'red'];

for (i = 1; i <= myarray.length; i = i +1) {
    console.log(myarray[i] + ' is my #' + i +' choice');
}


OBJECTS

var objectName = {
  property1: value,
  property2: value
};

var aboutMe = {
    hometown: 'como',
    hair: 'brown',
    eyes: 'brown',
    name: 'federico'
};quested

var mushkaCat = {
    age: 12,
    furColour: 'black',
    likes: ['catnip','milk','food'],
    birthday: {day: 17, month: 7, year: 2004 },
    meow: function () {
        console.log('meeeeow?');
    },
    eat: function(food) {
        console.log('mm, I love ' + food)
    },
    sleep: function (minutes) {
        for (var i = 0; i < minutes; i = i + 1) {
            console.log('z');
        }
    }
};

// give value to an existing property
aboutMe.eyes = 'brown';

// create a new property
aboutMe.gender = 'male';
// delete a property
delete aboutMe.gender;


METHOD TO GENERATE OBJECTS

function Cat(name,age,color,likes) {
    this.name = name;
    this.age = age;
    this.color = color;
    this.likes = likes; 
}


REGULAR EXPRESSION 

testing if string is present into another string
-> suggest result for search !!

var re = /ab/
'abcdef'.match(re);
=> [ 'ab', index: 0, input: 'abcdef' ]
re.test('abcd');
=> true
'fdeab'.search(re);
=> 3
'zzzzz'.search(re);
=> -1

var re = /(\w+)@(\w+)[.](\w+)$/; // ??????????
// this should be true
re.test("me@mydomain.com");


PROTOTYPE 

function Employee(name,dept) {
    this.name = name;
    this.dept = dept || 'accounting';
    }
    
function Manager(reports){
    this.reports = reports;
}

Manager.prototype = new Employee();


// manager inherit properties from Employee! also if new properties will be added in future.


// DOM  Document Object Model

  