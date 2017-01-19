// this file will containt any site-wide functions

var refreshRating = function() {
  // initialize plugin on the class="rating" element, in _new_comment.html.erb
  $('.rating').raty({ path: '/assets/images', scoreName: 'comment[rating]' }); //specify where image assets are found (stars)
    // plugin will display a row of stars that can’t be set. '.rated' class in _comments.html
    $('.rated').raty({ path: '/assets/images',
      readOnly: true, // stars will be shown as a rating. can't edit them.
      score: function() {
        return $(this).attr('data-score'); //attribute to dynamically populate the number of stars
      }
    });
};

$(document).on('turbolinks:load ajaxSuccess', function(){ // ajaxSuccess: contain the refreshRating logic in one file and will also update the rating stars whenever our AJAX call completes successfully, DRY.
  refreshRating(); //calls above function, inside 'document on load...'

  // elevate zoom plugin, to zoom into images.
  $('.img-zoom').elevateZoom({
    zoomType : "lens",
    lensShape : "round",
    lensSize : 300,
    scrollZoom : true
  });

});
