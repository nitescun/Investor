
$(document).ready(function () {
  sortButtonListener();
});


var sortButtonListener = function () {
  $(".investment_type").on("click", function (event) {
    event.preventDefault();


    var sortType = $(this).attr('id')


    var url = '/stocks?sort_type=' + sortType


    $.get(url)
    .done(function(response){
      console.log(response)
      $("#spage").html(response);
      // $("#hdiv").html(response)
    })
  })
  
}
