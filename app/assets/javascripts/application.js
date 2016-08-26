// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(document).ready(function () {   
  setTimeout(function(){
    $("#chart_of_account_revenue_id_input").hide();  
    $("#chart_of_account_asset_id_input").hide();
    $("#chart_of_account_expense_id_input").hide(); 
    $("#chart_of_account_name_input").hide(); 

    $("#chart_of_account_item_type_id").prop("required", "required");   
    $("#new_chart_of_account").removeAttr("novalidate");
  }, 1)
});

$(document).on("change", "#chart_of_account_item_type_id", function(e) {

  if(e.target.value == 1)
  {
    $("#chart_of_account_name_input").show();  
    $("#chart_of_account_revenue_id_input").show();  
    $("#chart_of_account_asset_id_input").show();
    $("#chart_of_account_expense_id_input").show(); 

    $("#chart_of_account_name").prop("required", "required");     
    $("#chart_of_account_revenue_id").prop("required", "required"); 
    $("#chart_of_account_asset_id").prop("required", "required"); 
    $("#chart_of_account_expense_id").prop("required", "required"); 
  }
  else if(e.target.value == 2)
  {
    $("#chart_of_account_name_input").show();
    $("#chart_of_account_revenue_id_input").show();     
    $("#chart_of_account_expense_id_input").show(); 
    $("#chart_of_account_asset_id_input").hide();

    $("#chart_of_account_name").prop("required", "required");     
    $("#chart_of_account_revenue_id").prop("required", "required"); 
    $("#chart_of_account_expense_id").prop("required", "required");
    $("#chart_of_account_asset_id").removeAttr("required");

  }
  else if(e.target.value == 3) {
    $("#chart_of_account_name_input").show();
    $("#chart_of_account_revenue_id_input").show();  
    $("#chart_of_account_asset_id_input").hide();
    $("#chart_of_account_expense_id_input").hide();

    $("#chart_of_account_name").prop("required", "required");     
    $("#chart_of_account_asset_id").removeAttr("required"); 
    $("#chart_of_account_expense_id").removeAttr("required"); 
  }
  else if(e.target.value == 4)
  {
    $("#chart_of_account_name_input").show();
    $("#chart_of_account_revenue_id_input").show();  
    $("#chart_of_account_asset_id_input").show();
    $("#chart_of_account_expense_id_input").show(); 

    $("#chart_of_account_name").prop("required", "required");     
    $("#chart_of_account_revenue_id").prop("required", "required"); 
    $("#chart_of_account_asset_id").prop("required", "required"); 
    $("#chart_of_account_expense_id").prop("required", "required"); 
  }
  else {
    $("#chart_of_account_name_input").hide();
    $("#chart_of_account_revenue_id_input").hide();  
    $("#chart_of_account_asset_id_input").hide();
    $("#chart_of_account_expense_id_input").hide();

    $("#chart_of_account_item_type_id").prop("required", "required");  
  }

});

