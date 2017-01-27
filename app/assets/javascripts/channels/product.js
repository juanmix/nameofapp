App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show(); //shows alert in product/show page.
    console.log(data);
    $('.product-reviews').prepend(data.comment); //data.comment contains the partial. So we just need to prepend it to our existing comments.
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating(); //refreshRating() to contain all the code to update Raty. You can even put all of the Raty code in here again, but that's obviously a little bit inefficient.
  },

  listen_to_comments: function() {
    // for our listen method to know which product it's supposed to stream_for,
    //it needs to know the product_id of the product page the user is currently viewing.
    //we need to add the product_id to the empty object we just created.
    return this.perform('listen', {
      //jQuery code to first select that element and then grab the value of the data-product-id attribute:
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

//we need to call the listen_to_comments() method when a user opens the page. Since we want to update the
// streaming channel every time the user changes the page, we are not going to use the connected method.
//This will make sure listen_to_comments() is called every single time the user loads a new page.
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});