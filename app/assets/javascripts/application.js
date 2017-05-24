// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .
//= require rails.validations
$(document).on("mouseenter", "tr", function(){
   $(this).children(".hide-link").children(".hidden-link-container").children().show();
});

$(document).on("mouseleave", "tr", function(){
   $(this).children(".hide-link").children(".hidden-link-container").children().hide();
});

$(document).ready(function () {
    $('.download-csv').on('click', function (e) {
       debugger;
        e.preventDefault();
        var link = this;
        var formData = $('form').serialize();
        link.href = link.href.toString().replace(/\?.+$/, "?" + formData + "&format=csv");
        location.href = link.href;
    });
});

$(document).ready( function() {
  $( "#start_date" ).datepicker();

  $(  "#end_date" ).datepicker({
      dateFormat: "yy-mm-dd",
      autoclose: true,
    }).datepicker('setDate', '0');

    // put in to prevent ui-datepicker-div(ghost calendar) from hanging around
    $(".hasDatepicker").click(function() {
      $('#ui-datepicker-div').css('display', 'none');
    });
    // put in to prevent ui-datepicker-div(ghost calendar) from being present on load
    $('#ui-datepicker-div').css('display', 'none');
} );

$(document).on('click', '#update', function() {
    toggleButtons();
    var url = $(this).data();
    debugger;
    var checked_arr = [];
    var unchecked_arr = [];

    rows = $('tr');

    // i starts at one to skip headers and -1 to
    // row.size because it need to account for that too
    for(var i = 1; i <= rows.size - 1; i++) {
        if(rows[i].is(':checked')) {
            checked_arr << rows.eq(i).find('td').eq(0).data('game-id');
        } else {
            unchecked_arr << rows.eq(i).find('td').eq(0).data('game-id');
        }
    }

    $.ajax({
        type: "PUT",
        dataType: "script",
        url: url,
        contentType: 'application/json',
        data: {checked: checked_arr,
               unchecked: unchecked_arr}
    });
});

$(document).on('click', '#edit-available, #cancel', function() {
    toggleButtons();
});

function toggleButtons() {
    var ele = $('#edit-available');

    if (ele.css('display') ==='none') {
      ele.css('display', 'inline');
    } else {
      ele.css('display', 'none');
    };

    var ele = $('#update');

    if (ele.css('display') ==='none') {
      ele.css('display', 'inline');
    } else {
      ele.css('display', 'none');
    };

    var ele = $('#cancel');

    if (ele.css('display') ==='none') {
      ele.css('display', 'inline');
    } else {
      ele.css('display', 'none');
    };
    
    var checkboxes = $(".available-checkbox");
    for(i=0; i< checkboxes.length; i++) {
        if (checkboxes[i].disabled == true) {
            checkboxes[i].disabled = false;
        } else {
            checkboxes[i].disabled = true;
        };
    };
};



