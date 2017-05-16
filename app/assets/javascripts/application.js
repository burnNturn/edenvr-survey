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
   $(this).children(".hide-link").children(".edit-delete-icon").show();
});

$(document).on("mouseleave", "tr", function(){
   $(this).children(".hide-link").children(".edit-delete-icon").hide();
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


function edit_click() {
    toggleButtons();
};

function update_click() {
    debugger;
    toggleButtons();
    var table = document.getElementById("games-table");
    
    for (i = 1; i < table.rows.length; i++) {
        var row = table.getElementsByTagName("tr")[i];
        var cells = row.cells;
        var game_id = cells[0].firstChild.value;
        var elem = document.getElementById("available_" + game_id)
        var avail = elem.checked;
        
        $.ajax({
            type: "PUT",
            dataType: "script",
            url: '/games/' + game_id,
            contentType: 'application/json',
            data: JSON.stringify({available:avail, _method: 'put'})
        }).done(function(msg) {
            alert("Data Saved: " + msg );
        });
        // $.put("/games/" + game_id + "/available=" + available);
    }
};

function cancel_click() {
    toggleButtons();
};

function toggleButtons() {
    var ele = document.getElementById('edit');
    if (ele.style.display ==='none') {
      ele.style.display = 'inline';
    } else {
      ele.style.display = 'none';
    };

    var ele = document.getElementById('update');
    if (ele.style.display ==='none') {
      ele.style.display = 'inline';
    } else {
      ele.style.display = 'none';
    };

    var ele = document.getElementById('cancel');
    if (ele.style.display ==='none') {
      ele.style.display = 'inline';
    } else {
      ele.style.display = 'none';
    };
    
    var checkboxes = document.getElementsByClassName("available-checkbox");
    for(i=0; i< checkboxes.length; i++) {
        if (checkboxes[i].disabled == true) {
            checkboxes[i].disabled = false;
        } else {
            checkboxes[i].disabled = true;
        };
    };
};



