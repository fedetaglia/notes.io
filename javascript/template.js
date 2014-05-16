library underscore.js


on html
  <script type="text/template" id="test-template">
    <div><h1>test template name is <%= name %></h1></div>
  </script>


with javascript could call
_.template($('#test-template').html(),{name: 'fede'});

"
    <div><h1>test template name is fede</h1></div>
  "
