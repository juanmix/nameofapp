// this file will containt any site-wide functions

// initialize plugin on the class="rating" element, in _new_comment.html.erb
$(document).on('turbolinks:load', function(){
  $('.rating').raty({ path: '/assets/images', scoreName: 'comment[rating]' }); //specify where image assets are found (stars)
  // plugin will display a row of stars that can’t be set. '.rated' class in _comments.html
  $('.rated').raty({ path: '/assets/images',
    readOnly: true, // stars will be shown as a rating. can't edit them.
    score: function() {
      return $(this).attr('data-score'); //attribute to dynamically populate the number of stars
    }
  });

  // elevate zoom plugin, to zoom into images.
  $('.img-zoom').elevateZoom({
    zoomType : "lens",
    lensShape : "round",
    lensSize : 300,
    scrollZoom : true
  });

});
