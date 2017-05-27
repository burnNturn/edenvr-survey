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

/********************/
/////CUSTOMERS JS/////
/********************/
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


/********************/
///////Game JS////////
/********************/
$(document).on('click', '#update', function() {
    toggleButtons();
    var url = $(this).attr('data-url');
    debugger;
    var checked_arr = getIdsOfCheckboxes($('td > input:checked'));
    var unchecked_arr = getIdsOfCheckboxes($("td > input:checkbox:not(:checked)"));

    $.ajax({
        type: "PUT",
        dataType: "script",
        url: url,
        data: {checked: checked_arr,
               unchecked: unchecked_arr}
    });
});

$(document).on('click', '#edit-available, #cancel', function() {
    toggleButtons();
});

//gets #ids from checkboxes EX: <input id='1'>
function getIdsOfCheckboxes(arr) {
    var idArr = []
    $.map(arr, function(n, i) {
	    idArr[i] = (parseInt(n.id));
    });
    return idArr;
}

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



