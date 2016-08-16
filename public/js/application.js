$(document).ready(function () {
  // Put your JavaScript behavior here
  $('.tabs li').on('click', function(event){
    event.preventDefault();

    //Method 1 (with edge case of clicking tab off)
    var unclicked_tabs = []
    var selector = function(index, li){
        unclicked_tabs.push(li)
      if ($(li).attr('id') != $(this).attr('id')){
      }
    };

    $('.tabs li').each(selector.bind(this))

    unclicked_tabs.forEach(function(li){
      $(li).removeClass('active')
    })

    $(this).toggleClass("active");

    //Method 2 (without ability to click tab off)
    // $('.tabs li').removeClass("active");
    // $(this).addClass("active");

    //grabs the id in <a href='#id'> tag of active tab
    var $addr = $('.active a').attr('href');
    $('.tab-content').css('display', 'none');
    $($addr).css('display', 'inline');
  })
});
