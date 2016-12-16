// because of turbolinks gem, the $(document).ready(function() {...}); doesnt work the same.
//because of turbolinks pages don't always to a full document refresh, so use
//$(document).on('turbolinks:load', function () { // All your code here });
//If you have any other event listeners running on $(document) itself
//(e.g. $(document).on("click", ...) that one should not be inside the
//$(document).on('turbolinks ... function. Instead, it should be next to it; above/below.
$(document).on('turbolinks:load', function() {
  console.log($(".alert"));
  $( ".alert" ).delay(4500).fadeOut(1000);

})